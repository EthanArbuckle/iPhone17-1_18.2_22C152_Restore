@interface PMLPassThroughTracker
- (PMLPassThroughTracker)initWithPlanId:(id)a3 numberOfBuckets:(unint64_t)a4;
- (PMLPassThroughTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4;
- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7;
- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6;
@end

@implementation PMLPassThroughTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsLock, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

- (PMLPassThroughTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7 = a5;
  v8 = [v7 objectForKeyedSubscript:@"planId"];

  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PMLPassThroughTracker.m", 108, @"Can't instantiate %@. Missing \"planId\" dependency.", v16 object file lineNumber description];
  }
  v9 = [v7 objectForKeyedSubscript:@"buckets"];

  if (!v9)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PMLPassThroughTracker.m", 109, @"Can't instantiate %@. Missing \"buckets\" dependency.", v19 object file lineNumber description];
  }
  v10 = [v7 objectForKeyedSubscript:@"planId"];
  v11 = [v7 objectForKeyedSubscript:@"buckets"];
  v12 = [(PMLPassThroughTracker *)self initWithPlanId:v10 numberOfBuckets:v11];

  return v12;
}

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  resultsLock = self->_resultsLock;
  id v7 = a4;
  id v8 = a3;
  [(NSLock *)resultsLock lock];
  results = self->_results;
  v16[0] = @"minibatchStats";
  v16[1] = @"evaluationMetrics";
  v17[0] = v7;
  v17[1] = v8;
  v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [(NSMutableArray *)results addObject:v10];

  v11 = (void *)[(NSMutableArray *)self->_results copy];
  [(NSLock *)self->_resultsLock unlock];
  v14 = @"results";
  v15 = v11;
  v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  return v12;
}

- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7
{
  v30[5] = *MEMORY[0x263EF8340];
  planId = self->_planId;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:planId];
  *(float *)&double v17 = a4;
  v18 = +[PMLProtoBufTracker messageForGradient:v15 scaleFactor:v14 minibatchStats:v13 evaluationMetrics:a7 serverIteration:v16 modelInfo:self->_quantizationNumberOfBuckets numberOfBuckets:v17];

  v19 = +[PMLSparseVector sparseVectorFromDense:v15];

  [(NSLock *)self->_resultsLock lock];
  results = self->_results;
  v30[0] = v19;
  v29[0] = @"gradient";
  v29[1] = @"scaleFactor";
  *(float *)&double v21 = a4;
  v22 = [NSNumber numberWithFloat:v21];
  v30[1] = v22;
  v30[2] = v14;
  v29[2] = @"minibatchStats";
  v29[3] = @"evaluationMetrics";
  v29[4] = @"AWDGradientMessage";
  v30[3] = v13;
  v30[4] = v18;
  v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];
  [(NSMutableArray *)results addObject:v23];

  v24 = (void *)[(NSMutableArray *)self->_results copy];
  [(NSLock *)self->_resultsLock unlock];
  v27 = @"results";
  v28 = v24;
  v25 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

  return v25;
}

- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6
{
  v28[5] = *MEMORY[0x263EF8340];
  planId = self->_planId;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:planId];
  *(float *)&double v15 = a4;
  v16 = +[PMLProtoBufTracker messageForWeights:v13 scaleFactor:v12 minibatchStats:v11 evaluationMetrics:v14 modelInfo:self->_quantizationNumberOfBuckets numberOfBuckets:v15];

  double v17 = +[PMLSparseVector sparseVectorFromDense:v13];

  [(NSLock *)self->_resultsLock lock];
  results = self->_results;
  v28[0] = v17;
  v27[0] = @"weights";
  v27[1] = @"scaleFactor";
  *(float *)&double v19 = a4;
  v20 = [NSNumber numberWithFloat:v19];
  v28[1] = v20;
  v28[2] = v12;
  v27[2] = @"minibatchStats";
  v27[3] = @"evaluationMetrics";
  v27[4] = @"AWDWeightsMessage";
  v28[3] = v11;
  v28[4] = v16;
  double v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
  [(NSMutableArray *)results addObject:v21];

  v22 = (void *)[(NSMutableArray *)self->_results copy];
  [(NSLock *)self->_resultsLock unlock];
  v25 = @"results";
  v26 = v22;
  v23 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  return v23;
}

- (PMLPassThroughTracker)initWithPlanId:(id)a3 numberOfBuckets:(unint64_t)a4
{
  id v8 = a3;
  if (v8)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PMLPassThroughTracker.m", 28, @"Invalid parameter not satisfying: %@", @"planId" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  double v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PMLPassThroughTracker.m", 29, @"Invalid parameter not satisfying: %@", @"buckets" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PMLPassThroughTracker;
  v9 = [(PMLPassThroughTracker *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_planId, a3);
    v10->_quantizationNumberOfBuckets = a4;
    uint64_t v11 = objc_opt_new();
    results = v10->_results;
    v10->_results = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    resultsLock = v10->_resultsLock;
    v10->_resultsLock = (NSLock *)v13;
  }
  return v10;
}

@end