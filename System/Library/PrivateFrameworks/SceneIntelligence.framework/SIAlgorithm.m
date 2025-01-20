@interface SIAlgorithm
+ (Class)inputDataClass;
+ (Class)outputDataClass;
+ (id)initWithNetworkConfiguration:(id)a3;
- (CGSize)getInputResolution;
- (CGSize)getOutputResolution;
- (SIAlgorithm)initWithNetworkConfiguration:(id)a3;
- (SIModel)model;
- (SINetworkConfiguration)networkConfiguration;
- (id)createEmptyInputDataWithExpectedFormat;
- (id)networkVersion;
- (id)subLoggers;
- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4;
- (int64_t)_postprocessingOutput:(id)a3;
- (int64_t)_preprocessingInputData:(id)a3;
- (int64_t)_runWithInput:(id)a3 output:(id)a4;
- (int64_t)runWithInput:(id)a3 output:(id)a4;
- (int64_t)runWithInput:(id)a3 output:(id)a4 resolutionConfiguration:(int64_t)a5;
- (int64_t)switchConfiguration:(unint64_t)a3;
- (void)addPrewiringBuffersToStreamWithInputPools:(id)a3 outputPools:(id)a4;
- (void)setNetworkConfiguration:(id)a3;
@end

@implementation SIAlgorithm

+ (Class)inputDataClass
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
    __int16 v6 = 1025;
    int v7 = 35;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Expected input class must be overriden ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

+ (Class)outputDataClass
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
    __int16 v6 = 1025;
    int v7 = 42;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Expected output class must be overriden ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

+ (id)initWithNetworkConfiguration:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 algorithmClassName];
  v5 = v4;
  if (v4)
  {
    __int16 v6 = (void *)[objc_alloc(NSClassFromString(v4)) initWithNetworkConfiguration:v3];
  }
  else
  {
    int v7 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      __int16 v11 = 1025;
      int v12 = 49;
      _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** algorithm name is not specified in the subclass ***", (uint8_t *)&v9, 0x12u);
    }

    __int16 v6 = 0;
  }

  return v6;
}

- (SIAlgorithm)initWithNetworkConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SIAlgorithm;
  __int16 v6 = [(SIAlgorithm *)&v16 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_networkConfiguration, a3);
    uint64_t v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 20);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = [objc_alloc(NSClassFromString(v10)) initWithNetworkConfiguration:v5];
    id v12 = p_isa[2];
    p_isa[2] = (id)v11;

    objc_msgSend(p_isa[2], "setMappingId:", (int)objc_msgSend(v5, "signpostMappingID"));
    if (p_isa[2])
    {
      uint64_t v13 = p_isa;
    }
    else
    {
      v14 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
        __int16 v19 = 1025;
        int v20 = 76;
        _os_log_impl(&dword_21B697000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to initialize ML model ***", buf, 0x12u);
      }

      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (CGSize)getOutputResolution
{
  [(SIModel *)self->_model getOutputResolution];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)getInputResolution
{
  [(SIModel *)self->_model getInputResolution];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)networkVersion
{
  return [(SIModel *)self->_model networkVersion];
}

- (int64_t)runWithInput:(id)a3 output:(id)a4
{
  return [(SIAlgorithm *)self runWithInput:a3 output:a4 resolutionConfiguration:-1];
}

- (int64_t)_runWithInput:(id)a3 output:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SIModel *)self->_model setFrameTimestamp:CFAbsoluteTimeGetCurrent()];
  [(id)objc_opt_class() inputDataClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v12 = (objc_class *)[(id)objc_opt_class() inputDataClass];
      uint64_t v13 = NSStringFromClass(v12);
      int v18 = 136381443;
      __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      __int16 v20 = 1025;
      int v21 = 106;
      __int16 v22 = 2113;
      v23 = v11;
      __int16 v24 = 2113;
      v25 = v13;
      v14 = " %{private}s:%{private}d *** Unexpected input data: %{private}@. (Expected %{private}@) ***";
LABEL_10:
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 0x26u);
    }
LABEL_11:

    int64_t v8 = 6;
    goto LABEL_12;
  }
  [(id)objc_opt_class() outputDataClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v15);
      objc_super v16 = (objc_class *)[(id)objc_opt_class() outputDataClass];
      uint64_t v13 = NSStringFromClass(v16);
      int v18 = 136381443;
      __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      __int16 v20 = 1025;
      int v21 = 112;
      __int16 v22 = 2113;
      v23 = v11;
      __int16 v24 = 2113;
      v25 = v13;
      v14 = " %{private}s:%{private}d *** Unexpected output data: %{private}@. (Expected %{private}@) ***";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [(SIModel *)self->_model algorithmNameHash];
  [(SIModel *)self->_model mappingId];
  kdebug_trace();
  int64_t v8 = [(SIAlgorithm *)self _preprocessingInputData:v6];
  [(SIModel *)self->_model algorithmNameHash];
  [(SIModel *)self->_model mappingId];
  kdebug_trace();
  if (!v8)
  {
    [(SIModel *)self->_model algorithmNameHash];
    [(SIModel *)self->_model mappingId];
    kdebug_trace();
    int64_t v8 = [(SIAlgorithm *)self _inferenceWithInput:v6 output:v7];
    [(SIModel *)self->_model algorithmNameHash];
    [(SIModel *)self->_model mappingId];
    kdebug_trace();
    if (!v8)
    {
      [(SIModel *)self->_model algorithmNameHash];
      [(SIModel *)self->_model mappingId];
      kdebug_trace();
      int64_t v8 = [(SIAlgorithm *)self _postprocessingOutput:v7];
      [(SIModel *)self->_model algorithmNameHash];
      [(SIModel *)self->_model mappingId];
      kdebug_trace();
    }
  }
LABEL_12:

  return v8;
}

- (int64_t)runWithInput:(id)a3 output:(id)a4 resolutionConfiguration:(int64_t)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(SIModel *)self->_model algorithmNameHash];
  [(SIModel *)self->_model mappingId];
  kdebug_trace();
  if (a5 < 0
    || ([(SIModel *)self->_model algorithmNameHash],
        [(SIModel *)self->_model mappingId],
        kdebug_trace(),
        int64_t v10 = [(SIAlgorithm *)self switchConfiguration:a5],
        [(SIModel *)self->_model algorithmNameHash],
        [(SIModel *)self->_model mappingId],
        kdebug_trace(),
        !v10))
  {
    int64_t v10 = [(SIAlgorithm *)self _runWithInput:v8 output:v9];
    [(SIModel *)self->_model algorithmNameHash];
    [(SIModel *)self->_model mappingId];
    kdebug_trace();
  }
  else
  {
    uint64_t v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136380931;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      __int16 v15 = 1025;
      int v16 = 163;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to switch configuration! ***", (uint8_t *)&v13, 0x12u);
    }
  }
  return v10;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int64_t result = [(SIModel *)self->_model switchNetworkConfiguration:a3];
  if (result)
  {
    int v4 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136380931;
      id v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      __int16 v7 = 1025;
      int v8 = 183;
      _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** fail to switch the configuration! The output is not updated ***", (uint8_t *)&v5, 0x12u);
    }

    return 5;
  }
  return result;
}

- (int64_t)_preprocessingInputData:(id)a3
{
  return 0;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return 0;
}

- (int64_t)_postprocessingOutput:(id)a3
{
  return 0;
}

- (void)addPrewiringBuffersToStreamWithInputPools:(id)a3 outputPools:(id)a4
{
}

- (id)createEmptyInputDataWithExpectedFormat
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    int v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
    __int16 v6 = 1025;
    int v7 = 216;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Must be implemented by the subclass ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (id)subLoggers
{
  return [(SIModel *)self->_model subLoggers];
}

- (SINetworkConfiguration)networkConfiguration
{
  return (SINetworkConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNetworkConfiguration:(id)a3
{
}

- (SIModel)model
{
  return (SIModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_networkConfiguration, 0);
}

@end