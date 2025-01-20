@interface PHACurareShadowEvaluationEvaluator
+ (id)evaluatorLog;
- (ETLossDefinition)lossDefinition;
- (ETOptimizerDefinition)optimizerDefinition;
- (NSString)labelName;
- (NSString)lossName;
- (NSString)modelInputName;
- (NSString)modelOutputName;
- (PHACurareShadowEvaluationEvaluator)initWithModelInputName:(id)a3 modelOutputName:(id)a4 lossName:(id)a5;
- (id)evaluateModelAtPath:(id)a3 labelIndex:(int)a4 labelOperatingPoint:(float)a5 isPositiveData:(BOOL)a6 evaluationData:(id)a7 error:(id *)a8;
- (id)evaluateModelAtPath:(id)a3 labelIndex:(int)a4 labelOperatingPoint:(float)a5 positiveEvaluationData:(id)a6 negativeEvaluationData:(id)a7 error:(id *)a8;
- (id)getDefaultEvaluationResultForModelPath:(id)a3 isPositiveData:(BOOL)a4;
- (int)accuracyForProbability:(id *)a3 isPositiveData:(BOOL)a4 atIndex:(int)a5 andOperatingPoint:(float)a6;
- (vector<unsigned)getEspressoBufferShapeWithBuffer:(PHACurareShadowEvaluationEvaluator *)self;
- (void)setLabelName:(id)a3;
- (void)setLossDefinition:(id)a3;
- (void)setLossName:(id)a3;
- (void)setModelInputName:(id)a3;
- (void)setModelOutputName:(id)a3;
- (void)setOptimizerDefinition:(id)a3;
@end

@implementation PHACurareShadowEvaluationEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerDefinition, 0);
  objc_storeStrong((id *)&self->_lossDefinition, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);

  objc_storeStrong((id *)&self->_modelInputName, 0);
}

- (void)setOptimizerDefinition:(id)a3
{
}

- (ETOptimizerDefinition)optimizerDefinition
{
  return self->_optimizerDefinition;
}

- (void)setLossDefinition:(id)a3
{
}

- (ETLossDefinition)lossDefinition
{
  return self->_lossDefinition;
}

- (void)setLabelName:(id)a3
{
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setLossName:(id)a3
{
}

- (NSString)lossName
{
  return self->_lossName;
}

- (void)setModelOutputName:(id)a3
{
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setModelInputName:(id)a3
{
}

- (NSString)modelInputName
{
  return self->_modelInputName;
}

- (id)getDefaultEvaluationResultForModelPath:(id)a3 isPositiveData:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [PHACurareShadowEvaluationEvaluationResult alloc];
  v7 = [NSNumber numberWithInt:0];
  v8 = [NSNumber numberWithInt:0];
  v9 = [NSNumber numberWithFloat:0.0];
  v10 = [NSNumber numberWithFloat:0.0];
  v11 = [(PHACurareShadowEvaluationEvaluationResult *)v6 initWithModelPath:v5 isPositiveData:v4 numberOfTotalSamples:v7 numberOfCorrectSamples:v8 meanPredictionValue:v9 stddevPredictionValue:v10];

  return v11;
}

- (vector<unsigned)getEspressoBufferShapeWithBuffer:(PHACurareShadowEvaluationEvaluator *)self
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  result = (vector<unsigned long, std::allocator<unsigned long>> *)espresso_buffer_unpack_tensor_shape();
  if (result) {
    __assert_rtn("[(PHACurareShadowEvaluationEvaluator *)buf getEspressoBufferShapeWithBuffer:shape] == ESPRESSO_STATUS_SUCCESS");
  }
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  return result;
}

- (int)accuracyForProbability:(id *)a3 isPositiveData:(BOOL)a4 atIndex:(int)a5 andOperatingPoint:(float)a6
{
  BOOL v8 = a4;
  -[PHACurareShadowEvaluationEvaluator getEspressoBufferShapeWithBuffer:](self, "getEspressoBufferShapeWithBuffer:");
  uint64_t v10 = *__p;
  if (*__p)
  {
    int v11 = 0;
    v12 = (float *)((char *)a3->var0 + 4 * a5);
    do
    {
      if (v8)
      {
        if (*v12 >= a6) {
          ++v11;
        }
      }
      else if (*v12 < a6)
      {
        ++v11;
      }
      v12 += __p[1];
      --v10;
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }
  operator delete(__p);
  return v11;
}

- (id)evaluateModelAtPath:(id)a3 labelIndex:(int)a4 labelOperatingPoint:(float)a5 isPositiveData:(BOOL)a6 evaluationData:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v12 = *(void *)&a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v54 = a7;
  id v15 = v14;
  v16 = (const char *)objc_msgSend(v15, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding"));
  size_t v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v18 = (void *)v17;
  if (v17 >= 0x17)
  {
    uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v20 = v17 | 7;
    }
    uint64_t v21 = v20 + 1;
    v19 = (void **)operator new(v20 + 1);
    __dst[1] = v18;
    unint64_t v58 = v21 | 0x8000000000000000;
    __dst[0] = v19;
    goto LABEL_8;
  }
  HIBYTE(v58) = v17;
  v19 = __dst;
  if (v17) {
LABEL_8:
  }
    memmove(v19, v16, (size_t)v18);
  *((unsigned char *)v18 + (void)v19) = 0;
  if (!espresso_create_context())
  {
    v22 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Failed to create Espresso context", buf, 2u);
    }
    goto LABEL_28;
  }
  if (!espresso_create_plan())
  {
    v22 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Failed to create Espresso plan", buf, 2u);
    }
    goto LABEL_28;
  }
  if (espresso_plan_add_network())
  {
    v22 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Failed to add Espresso network", buf, 2u);
    }
LABEL_28:

LABEL_29:
    v23 = 0;
    goto LABEL_30;
  }
  espresso_get_input_blob_name();
  espresso_get_output_blob_name();
  if (espresso_network_declare_output())
  {
    v22 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Failed to declare Espresso network output", buf, 2u);
    }
    goto LABEL_28;
  }
  if (espresso_plan_build())
  {
    v22 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Failed to build Espresso plan", buf, 2u);
    }
    goto LABEL_28;
  }
  if (espresso_network_bind_buffer())
  {
    v25 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      _os_log_error_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_ERROR, "Failed to bind Espresso data buffer", v59, 2u);
    }

    if (espresso_plan_destroy())
    {
      v26 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v59 = 0;
        _os_log_error_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_ERROR, "Failed to destroy Espresso plan", v59, 2u);
      }
    }
    if (!espresso_context_destroy()) {
      goto LABEL_29;
    }
    v27 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      v28 = "Failed to destroy Espresso context";
LABEL_70:
      _os_log_error_impl(&dword_1D21F2000, v27, OS_LOG_TYPE_ERROR, v28, v59, 2u);
    }
  }
  else
  {
    if (!espresso_network_bind_buffer())
    {
      uint64_t v51 = [v54 numberOfDataPoints];
      unsigned int v52 = 0;
      unint64_t v53 = 0;
      float v31 = 0.0;
      float v32 = 0.0;
      while (v53 < objc_msgSend(v54, "numberOfDataPoints", v51))
      {
        v33 = [v54 labeledDataSamples];
        v34 = [v33 objectAtIndexedSubscript:v53];
        v27 = [v34 floatVector];

        id v35 = [v27 data];
        v36 = (const void *)[v35 bytes];

        memcpy(*(void **)buf, v36, 4 * [v27 count]);
        if (espresso_plan_execute_sync())
        {
          v41 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v59 = 0;
            _os_log_error_impl(&dword_1D21F2000, v41, OS_LOG_TYPE_ERROR, "Failed to execute Espresso plan", v59, 2u);
          }

          goto LABEL_71;
        }
        *(float *)&double v37 = a5;
        int v38 = [(PHACurareShadowEvaluationEvaluator *)self accuracyForProbability:v55 isPositiveData:v10 atIndex:v12 andOperatingPoint:v37];
        float v39 = *(float *)(v55[0] + 4 * (int)v12);

        v52 += v38;
        float v31 = v31 + v39;
        float v32 = v32 + (float)(v39 * v39);
        ++v53;
      }
      float v40 = 0.0;
      if ((int)v51 >= 2)
      {
        float v40 = sqrtf((float)((float)((float)(int)v51 * v32) - (float)(v31 * v31))/ (float)((float)((float)(int)v51 + -1.0) * (float)(int)v51));
        float v31 = v31 / (float)(int)v51;
      }
      if (espresso_plan_destroy())
      {
        v27 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_WORD *)v59 = 0;
        v28 = "Failed to destroy Espresso plan";
      }
      else
      {
        if (!espresso_context_destroy())
        {
          v42 = [PHACurareShadowEvaluationEvaluationResult alloc];
          v43 = [NSNumber numberWithInt:v51];
          v44 = [NSNumber numberWithInt:v52];
          *(float *)&double v45 = v31;
          v46 = [NSNumber numberWithFloat:v45];
          *(float *)&double v47 = v40;
          v48 = [NSNumber numberWithFloat:v47];
          v27 = [(PHACurareShadowEvaluationEvaluationResult *)v42 initWithModelPath:v15 isPositiveData:v10 numberOfTotalSamples:v43 numberOfCorrectSamples:v44 meanPredictionValue:v46 stddevPredictionValue:v48];

          if (!*a8 && v27)
          {
            v27 = v27;
            v23 = v27;
            goto LABEL_72;
          }
          v49 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            id v50 = *a8;
            *(_DWORD *)v59 = 138412290;
            id v60 = v50;
            _os_log_error_impl(&dword_1D21F2000, v49, OS_LOG_TYPE_ERROR, "Failed to run evaluateModelAtPath with error: %@", v59, 0xCu);
          }

          goto LABEL_71;
        }
        v27 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_WORD *)v59 = 0;
        v28 = "Failed to destroy Espresso context";
      }
      goto LABEL_70;
    }
    v29 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      _os_log_error_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_ERROR, "Failed to bind Espresso probability buffer", v59, 2u);
    }

    if (espresso_plan_destroy())
    {
      v30 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v59 = 0;
        _os_log_error_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_ERROR, "Failed to destroy Espresso plan", v59, 2u);
      }
    }
    if (!espresso_context_destroy()) {
      goto LABEL_29;
    }
    v27 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      v28 = "Failed to destroy Espresso context";
      goto LABEL_70;
    }
  }
LABEL_71:
  v23 = 0;
LABEL_72:

LABEL_30:
  if (SHIBYTE(v58) < 0) {
    operator delete(__dst[0]);
  }

  return v23;
}

- (id)evaluateModelAtPath:(id)a3 labelIndex:(int)a4 labelOperatingPoint:(float)a5 positiveEvaluationData:(id)a6 negativeEvaluationData:(id)a7 error:(id *)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v15)
  {
    *(float *)&double v18 = a5;
    uint64_t v19 = [(PHACurareShadowEvaluationEvaluator *)self evaluateModelAtPath:v14 labelIndex:v12 labelOperatingPoint:1 isPositiveData:v15 evaluationData:a8 error:v18];
    uint64_t v20 = (void *)v19;
    if (*a8 || !v19)
    {
      v23 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v27 = *a8;
        int v29 = 138412290;
        id v30 = v27;
        _os_log_error_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_ERROR, "Failed to run evaluateModelWithEspressoPlan on positive data with error: %@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_12;
    }
    [v17 addObject:v19];
  }
  else
  {
    uint64_t v20 = [(PHACurareShadowEvaluationEvaluator *)self getDefaultEvaluationResultForModelPath:v14 isPositiveData:1];
    [v17 addObject:v20];
  }

  if (!v16)
  {
    uint64_t v20 = [(PHACurareShadowEvaluationEvaluator *)self getDefaultEvaluationResultForModelPath:v14 isPositiveData:0];
    [v17 addObject:v20];
    goto LABEL_14;
  }
  *(float *)&double v21 = a5;
  uint64_t v22 = [(PHACurareShadowEvaluationEvaluator *)self evaluateModelAtPath:v14 labelIndex:v12 labelOperatingPoint:0 isPositiveData:v16 evaluationData:a8 error:v21];
  uint64_t v20 = (void *)v22;
  if (*a8 || !v22)
  {
    v23 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v28 = *a8;
      int v29 = 138412290;
      id v30 = v28;
      _os_log_error_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_ERROR, "Failed to run evaluateModelWithEspressoPlan on negative data with error: %@", (uint8_t *)&v29, 0xCu);
    }
LABEL_12:

    goto LABEL_22;
  }
  [v17 addObject:v22];
LABEL_14:

  if ([v17 count])
  {
    id v24 = v17;
    goto LABEL_23;
  }
  v25 = +[PHACurareShadowEvaluationEvaluator evaluatorLog];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int v29 = 138412290;
    id v30 = v14;
    _os_log_error_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_ERROR, "Failed to generate any evaluation results on model at path: %@. Returning nil.", (uint8_t *)&v29, 0xCu);
  }

LABEL_22:
  id v24 = 0;
LABEL_23:

  return v24;
}

- (PHACurareShadowEvaluationEvaluator)initWithModelInputName:(id)a3 modelOutputName:(id)a4 lossName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHACurareShadowEvaluationEvaluator;
  uint64_t v12 = [(PHACurareShadowEvaluationEvaluator *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelInputName, a3);
    objc_storeStrong((id *)&v13->_modelOutputName, a4);
    p_lossName = (id *)&v13->_lossName;
    objc_storeStrong((id *)&v13->_lossName, a5);
    labelName = v13->_labelName;
    v13->_labelName = (NSString *)@"label";

    if ([(NSString *)v13->_lossName isEqualToString:@"mse"])
    {
      uint64_t v16 = [MEMORY[0x1E4F611A8] L2LossWithInputName:v13->_modelOutputName targetInputName:v13->_labelName lossOutputName:v13->_lossName];
    }
    else
    {
      if ([*p_lossName isEqualToString:@"cross_entropy"]) {
        [MEMORY[0x1E4F611A8] crossEntropyLossWithInputName:v13->_modelOutputName targetInputName:v13->_labelName lossOutputName:v13->_lossName];
      }
      else {
      uint64_t v16 = [MEMORY[0x1E4F611A8] BuiltInLoss:*p_lossName];
      }
    }
    lossDefinition = v13->_lossDefinition;
    v13->_lossDefinition = (ETLossDefinition *)v16;
  }
  return v13;
}

+ (id)evaluatorLog
{
  if (+[PHACurareShadowEvaluationEvaluator evaluatorLog]::onceToken != -1) {
    dispatch_once(&+[PHACurareShadowEvaluationEvaluator evaluatorLog]::onceToken, &__block_literal_global_5542);
  }
  v2 = (void *)+[PHACurareShadowEvaluationEvaluator evaluatorLog]::evaluatorLog;

  return v2;
}

uint64_t __50__PHACurareShadowEvaluationEvaluator_evaluatorLog__block_invoke()
{
  +[PHACurareShadowEvaluationEvaluator evaluatorLog]::evaluatorLog = (uint64_t)os_log_create("com.apple.PhotoAnalysis.PhotoAnalysisLighthousePlugin", "Evaluator");

  return MEMORY[0x1F41817F8]();
}

@end