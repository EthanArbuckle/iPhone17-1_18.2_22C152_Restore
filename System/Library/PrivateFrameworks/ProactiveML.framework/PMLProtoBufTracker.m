@interface PMLProtoBufTracker
+ (id)awdTrackerForPlanId:(id)a3;
+ (id)messageForGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7 modelInfo:(id)a8 numberOfBuckets:(unint64_t)a9;
+ (id)messageForWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 modelInfo:(id)a7 numberOfBuckets:(unint64_t)a8;
+ (id)parsecTrackerForPlanId:(id)a3;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (PMLProtoBufTracker)initWithAdapter:(id)a3 modelInfo:(id)a4;
- (PMLProtoBufTracker)initWithAdapter:(id)a3 modelInfo:(id)a4 quantizationBuckets:(unint64_t)a5;
- (PMLProtoBufTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLTrackerAdapterProtocol)adapter;
- (id)toPlistWithChunks:(id)a3;
- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4;
- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7;
- (id)trackPrecisionAtK:(id)a3;
- (id)trackPrecisionAtK:(id)a3 minibatchStats:(id)a4;
- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6;
- (unint64_t)quantizationNumberOfBuckets;
@end

@implementation PMLProtoBufTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
}

- (unint64_t)quantizationNumberOfBuckets
{
  return self->_quantizationNumberOfBuckets;
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (PMLTrackerAdapterProtocol)adapter
{
  return self->_adapter;
}

- (PMLProtoBufTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 objectForKeyedSubscript:@"TRACKER_ADAPTER_CLASS"];
  if (!NSClassFromString(v10))
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, self, @"PMLProtoBufTracker.m", 218, @"Can't instantiate %@. Unknown class: %@", v20, v10 object file lineNumber description];
  }
  v11 = [v8 objectForKeyedSubscript:@"planId"];

  if (!v11)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [v21 handleFailureInMethod:a2, self, @"PMLProtoBufTracker.m", 219, @"Can't instantiate %@. Missing \"planId\" dependency.", v23 object file lineNumber description];
  }
  v12 = [v8 objectForKeyedSubscript:@"planId"];
  v13 = +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:v12];

  v14 = objc_opt_new();
  v15 = [v9 objectForKeyedSubscript:@"TRACKER_QUANTIZATION_BUCKETS"];

  v16 = -[PMLProtoBufTracker initWithAdapter:modelInfo:quantizationBuckets:](self, "initWithAdapter:modelInfo:quantizationBuckets:", v14, v13, [v15 unsignedLongLongValue]);
  return v16;
}

- (id)toPlistWithChunks:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"TRACKER_ADAPTER_CLASS";
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9[1] = @"TRACKER_QUANTIZATION_BUCKETS";
  v10[0] = v5;
  v6 = [NSNumber numberWithUnsignedLongLong:self->_quantizationNumberOfBuckets];
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)trackPrecisionAtK:(id)a3 minibatchStats:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = (void *)[(AWDProactiveModelFittingModelInfo *)self->_modelInfo copy];
  [v8 setModelInfo:v9];

  v10 = [MEMORY[0x263EFF910] date];
  [v10 timeIntervalSince1970];
  [v8 setTimestamp:(unint64_t)v11];

  [v8 setMinibatchStats:v6];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__PMLProtoBufTracker_trackPrecisionAtK_minibatchStats___block_invoke;
  v16[3] = &unk_26459F600;
  id v12 = v8;
  id v17 = v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v16];

  v13 = PML_LogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    modelInfo = self->_modelInfo;
    *(_DWORD *)buf = 138412290;
    v19 = modelInfo;
    _os_log_debug_impl(&dword_2212A0000, v13, OS_LOG_TYPE_DEBUG, "Sending evaluation metrics for %@", buf, 0xCu);
  }

  [(PMLTrackerAdapterProtocol *)self->_adapter postMetricId:5636102 message:v12];
  return 0;
}

void __55__PMLProtoBufTracker_trackPrecisionAtK_minibatchStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v11 = (id)objc_opt_new();
  uint64_t v7 = [v6 unsignedIntegerValue];

  [v11 setK:v7];
  [v5 floatValue];
  int v9 = v8;

  LODWORD(v10) = v9;
  [v11 setPrecision:v10];
  [*(id *)(a1 + 32) addPrecisionAtK:v11];
}

- (id)trackPrecisionAtK:(id)a3
{
  id v4 = a3;
  id v5 = +[AWDProactiveModelFittingMinibatchStats statsWithSize:0 support:0.0];
  id v6 = [(PMLProtoBufTracker *)self trackPrecisionAtK:v4 minibatchStats:v5];

  return v6;
}

- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  int v8 = objc_opt_new();
  int v9 = (void *)[(AWDProactiveModelFittingModelInfo *)self->_modelInfo copy];
  [v8 setModelInfo:v9];

  double v10 = [MEMORY[0x263EFF910] date];
  [v10 timeIntervalSince1970];
  [v8 setTimestamp:(unint64_t)v11];

  [v8 setMinibatchStats:v6];
  [v8 setEvaluationMetrics:v7];

  id v12 = PML_LogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    modelInfo = self->_modelInfo;
    int v15 = 138412290;
    v16 = modelInfo;
    _os_log_debug_impl(&dword_2212A0000, v12, OS_LOG_TYPE_DEBUG, "Sending evaluation metrics for %@", (uint8_t *)&v15, 0xCu);
  }

  [(PMLTrackerAdapterProtocol *)self->_adapter postMetricId:5636102 message:v8];
  return 0;
}

- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  modelInfo = self->_modelInfo;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = (void *)[(AWDProactiveModelFittingModelInfo *)modelInfo copy];
  *(float *)&double v17 = a4;
  v18 = +[PMLProtoBufTracker messageForGradient:v15 scaleFactor:v14 minibatchStats:v13 evaluationMetrics:a7 serverIteration:v16 modelInfo:self->_quantizationNumberOfBuckets numberOfBuckets:v17];

  v19 = PML_LogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v21 = self->_modelInfo;
    int v22 = 138412290;
    v23 = v21;
    _os_log_debug_impl(&dword_2212A0000, v19, OS_LOG_TYPE_DEBUG, "Sending gradient for model %@", (uint8_t *)&v22, 0xCu);
  }

  [(PMLTrackerAdapterProtocol *)self->_adapter postMetricId:5636101 message:v18];
  return 0;
}

- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  modelInfo = self->_modelInfo;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = (void *)[(AWDProactiveModelFittingModelInfo *)modelInfo copy];
  *(float *)&double v15 = a4;
  v16 = +[PMLProtoBufTracker messageForWeights:v13 scaleFactor:v12 minibatchStats:v11 evaluationMetrics:v14 modelInfo:self->_quantizationNumberOfBuckets numberOfBuckets:v15];

  double v17 = PML_LogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = self->_modelInfo;
    int v20 = 138412290;
    v21 = v19;
    _os_log_debug_impl(&dword_2212A0000, v17, OS_LOG_TYPE_DEBUG, "Sending weights for model %@", (uint8_t *)&v20, 0xCu);
  }

  [(PMLTrackerAdapterProtocol *)self->_adapter postMetricId:5636100 message:v16];
  return 0;
}

- (PMLProtoBufTracker)initWithAdapter:(id)a3 modelInfo:(id)a4 quantizationBuckets:(unint64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PMLProtoBufTracker.m", 67, @"Invalid parameter not satisfying: %@", @"adapter" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  double v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PMLProtoBufTracker.m", 68, @"Invalid parameter not satisfying: %@", @"modelInfo" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PMLProtoBufTracker;
  id v13 = [(PMLProtoBufTracker *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adapter, a3);
    objc_storeStrong((id *)&v14->_modelInfo, a4);
    v14->_quantizationNumberOfBuckets = a5;
  }

  return v14;
}

- (PMLProtoBufTracker)initWithAdapter:(id)a3 modelInfo:(id)a4
{
  return [(PMLProtoBufTracker *)self initWithAdapter:a3 modelInfo:a4 quantizationBuckets:0xFFFFLL];
}

+ (id)messageForGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7 modelInfo:(id)a8 numberOfBuckets:(unint64_t)a9
{
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  v19 = objc_opt_new();
  [v19 setModelInfo:v15];

  int v20 = [MEMORY[0x263EFF910] date];
  [v20 timeIntervalSince1970];
  [v19 setTimestamp:(unint64_t)v21];

  [v19 setMinibatchStats:v17];
  [v19 setEvaluationMetrics:v16];

  *(float *)&double v22 = a4;
  [v19 setGradientScaleFactor:v22];
  [v19 setIteration:a7];
  [v18 density];
  if (v23 >= 0.5)
  {
    uint64_t v24 = +[AWDProactiveModelFittingQuantizedDenseVector quantizedDenseVectorFromDenseVector:v18 numberOfBuckets:a9];

    [v19 setDenseQuantizedGradient:v24];
  }
  else
  {
    uint64_t v24 = +[AWDProactiveModelFittingQuantizedSparseVector quantizedSparseVectorFromDenseVector:v18 numberOfBuckets:a9];

    [v19 setSparseQuantizedGradient:v24];
  }

  return v19;
}

+ (id)messageForWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 modelInfo:(id)a7 numberOfBuckets:(unint64_t)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = objc_opt_new();
  [v17 setModelInfo:v13];

  id v18 = [MEMORY[0x263EFF910] date];
  [v18 timeIntervalSince1970];
  [v17 setTimestamp:(unint64_t)v19];

  [v17 setMinibatchStats:v15];
  [v17 setEvaluationMetrics:v14];

  *(float *)&double v20 = a4;
  [v17 setWeightsScaleFactor:v20];
  [v16 density];
  if (v21 >= 0.5)
  {
    double v22 = +[AWDProactiveModelFittingQuantizedDenseVector quantizedDenseVectorFromDenseVector:v16 numberOfBuckets:a8];

    [v17 setDenseQuantizedWeights:v22];
  }
  else
  {
    double v22 = +[AWDProactiveModelFittingQuantizedSparseVector quantizedSparseVectorFromDenseVector:v16 numberOfBuckets:a8];

    [v17 setSparseQuantizedWeights:v22];
  }

  return v17;
}

+ (id)parsecTrackerForPlanId:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:v4];

  id v7 = (void *)[objc_alloc((Class)a1) initWithAdapter:v5 modelInfo:v6];
  return v7;
}

+ (id)awdTrackerForPlanId:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:v4];

  id v7 = (void *)[objc_alloc((Class)a1) initWithAdapter:v5 modelInfo:v6];
  return v7;
}

@end