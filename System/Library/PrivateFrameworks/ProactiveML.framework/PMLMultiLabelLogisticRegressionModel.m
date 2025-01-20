@interface PMLMultiLabelLogisticRegressionModel
- (PMLMultiLabelLogisticRegressionModel)initWithModels:(id)a3;
- (PMLMultiLabelLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLMultiLabelLogisticRegressionModel)initWithWeightsArray:(id)a3 andIntercept:(BOOL)a4;
- (id)predict:(id)a3;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)outputDimension;
@end

@implementation PMLMultiLabelLogisticRegressionModel

- (void).cxx_destruct
{
}

- (PMLMultiLabelLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [[PMLPlistClassWrapper alloc] initWithClassNameKey:@"CLASS_NAME"];
  v11 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v12 = [v7 objectForKeyedSubscript:@"MULTI_LABEL_REGRESSION_MODELS"];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [(PMLPlistClassWrapper *)v10 readObjectWithPlist:*(void *)(*((void *)&v21 + 1) + 8 * v16) chunks:v8 context:v9];
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  v18 = [(PMLMultiLabelLogisticRegressionModel *)self initWithModels:v11];
  return v18;
}

- (id)toPlistWithChunks:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[PMLPlistClassWrapper alloc] initWithClassNameKey:@"CLASS_NAME"];
  v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_models;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[PMLPlistClassWrapper writeToPlistWithObject:andChunks:](v5, "writeToPlistWithObject:andChunks:", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, (void)v15);
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }

  v19 = @"MULTI_LABEL_REGRESSION_MODELS";
  v20 = v6;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  return v13;
}

- (id)predict:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_models, "count"));
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = self->_models;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "predict:", v4, (void)v17);
          v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 firstObject];
            [v5 addObject:v13];
          }
          else
          {
            [v5 addObject:&unk_26D336290];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    id j = v5;
  }
  else
  {
    unint64_t v15 = [(PMLMultiLabelLogisticRegressionModel *)self outputDimension];
    for (id j = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15]; v15; --v15)
      [j addObject:&unk_26D336290];
  }

  return j;
}

- (unint64_t)outputDimension
{
  return [(NSArray *)self->_models count];
}

- (PMLMultiLabelLogisticRegressionModel)initWithModels:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLMultiLabelLogisticRegressionModel;
  v6 = [(PMLMultiLabelLogisticRegressionModel *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_models, a3);
  }

  return v7;
}

- (PMLMultiLabelLogisticRegressionModel)initWithWeightsArray:(id)a3 andIntercept:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[PMLLogisticRegressionModel withWeights:andIntercept:](PMLLogisticRegressionModel, "withWeights:andIntercept:", *(void *)(*((void *)&v16 + 1) + 8 * v12), v4, (void)v16);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(PMLMultiLabelLogisticRegressionModel *)self initWithModels:v7];
  return v14;
}

@end