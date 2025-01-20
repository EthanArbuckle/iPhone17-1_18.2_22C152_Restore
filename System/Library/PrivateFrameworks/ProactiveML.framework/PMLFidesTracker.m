@interface PMLFidesTracker
- (PMLFidesTracker)initWithPlanId:(id)a3;
- (PMLFidesTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4;
- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7;
- (id)trackPrecisionAtK:(id)a3;
- (id)trackPrecisionAtK:(id)a3 minibatchStats:(id)a4;
- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6;
@end

@implementation PMLFidesTracker

- (void).cxx_destruct
{
}

- (PMLFidesTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7 = a5;
  v8 = [v7 objectForKeyedSubscript:@"planId"];

  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PMLFidesTracker.m", 176, @"Can't instantiate %@. Missing \"planId\" dependency.", v14 object file lineNumber description];
  }
  v9 = [v7 objectForKeyedSubscript:@"planId"];
  v10 = [(PMLFidesTracker *)self initWithPlanId:v9];

  return v10;
}

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)trackPrecisionAtK:(id)a3 minibatchStats:(id)a4
{
  v26[3] = *MEMORY[0x263EF8340];
  planId = self->_planId;
  id v6 = a4;
  id v7 = a3;
  v8 = +[PMLPlanDescriptor descriptorFromPlanId:planId];
  v9 = objc_opt_new();
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __52__PMLFidesTracker_trackPrecisionAtK_minibatchStats___block_invoke;
  v21 = &unk_26459F600;
  id v22 = v9;
  id v10 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:&v18];

  v25[0] = @"plan";
  v23[0] = @"name";
  v11 = objc_msgSend(v8, "name", v18, v19, v20, v21);
  v24[0] = v11;
  v23[1] = @"version";
  v12 = [v8 version];
  v24[1] = v12;
  v23[2] = @"locale";
  v13 = [v8 locale];
  v24[2] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  v26[0] = v14;
  v25[1] = @"minibatchStats";
  v15 = [v6 toDictionary];

  v25[2] = @"precisionAtK";
  v26[1] = v15;
  v26[2] = v10;
  v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  return v16;
}

void __52__PMLFidesTracker_trackPrecisionAtK_minibatchStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 stringValue];
  [v4 setObject:v5 forKeyedSubscript:v6];
}

- (id)trackPrecisionAtK:(id)a3
{
  id v4 = a3;
  id v5 = +[AWDProactiveModelFittingMinibatchStats statsWithSize:0 support:0.0];
  id v6 = [(PMLFidesTracker *)self trackPrecisionAtK:v4 minibatchStats:v5];

  return v6;
}

- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4
{
  v20[3] = *MEMORY[0x263EF8340];
  planId = self->_planId;
  id v6 = a4;
  id v7 = a3;
  v8 = +[PMLPlanDescriptor descriptorFromPlanId:planId];
  v19[0] = @"plan";
  v17[0] = @"name";
  v9 = [v8 name];
  v18[0] = v9;
  v17[1] = @"version";
  id v10 = [v8 version];
  v18[1] = v10;
  v17[2] = @"locale";
  v11 = [v8 locale];
  v18[2] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  v20[0] = v12;
  v19[1] = @"minibatchStats";
  v13 = [v6 toDictionary];

  v20[1] = v13;
  v19[2] = @"evaluationMetrics";
  v14 = [v7 toDictionary];

  v20[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  return v15;
}

- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7
{
  v28[5] = *MEMORY[0x263EF8340];
  planId = self->_planId;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = +[PMLPlanDescriptor descriptorFromPlanId:planId];
  v27[0] = @"plan";
  v25[0] = @"name";
  v14 = [v13 name];
  v26[0] = v14;
  v25[1] = @"version";
  v15 = [v13 version];
  v26[1] = v15;
  v25[2] = @"locale";
  v16 = [v13 locale];
  v26[2] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  v28[0] = v17;
  v27[1] = @"minibatchStats";
  uint64_t v18 = [v11 toDictionary];

  v28[1] = v18;
  v27[2] = @"evaluationMetrics";
  uint64_t v19 = [v10 toDictionary];

  v28[2] = v19;
  v27[3] = @"gradient";
  v20 = [v12 data];

  v28[3] = v20;
  v27[4] = @"serverIteration";
  v21 = [NSNumber numberWithUnsignedInteger:a7];
  v28[4] = v21;
  id v22 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];

  return v22;
}

- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6
{
  v25[5] = *MEMORY[0x263EF8340];
  planId = self->_planId;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = +[PMLPlanDescriptor descriptorFromPlanId:planId];
  v24[0] = @"plan";
  v22[0] = @"name";
  v13 = [v12 name];
  v23[0] = v13;
  v22[1] = @"version";
  v14 = [v12 version];
  v23[1] = v14;
  v22[2] = @"locale";
  v15 = [v12 locale];
  v23[2] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v25[0] = v16;
  v24[1] = @"minibatchStats";
  v17 = [v10 toDictionary];

  v25[1] = v17;
  v24[2] = @"evaluationMetrics";
  uint64_t v18 = [v9 toDictionary];

  v25[2] = v18;
  void v24[3] = @"weights";
  uint64_t v19 = [v11 data];

  v24[4] = @"serverIteration";
  void v25[3] = v19;
  v25[4] = &unk_26D3365A8;
  v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

  return v20;
}

- (PMLFidesTracker)initWithPlanId:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PMLFidesTracker.m", 66, @"Invalid parameter not satisfying: %@", @"planId" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PMLFidesTracker;
  id v7 = [(PMLFidesTracker *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_planId, a3);
  }

  return v8;
}

@end