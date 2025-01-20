@interface spotlight_l3_1
+ (id)URLOfModelInThisBundle;
+ (void)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromId_features:(id)a3 dense_features:(id)a4 error:(id *)a5;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (spotlight_l3_1)init;
- (spotlight_l3_1)initWithConfiguration:(id)a3 error:(id *)a4;
- (spotlight_l3_1)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (spotlight_l3_1)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (spotlight_l3_1)initWithMLModel:(id)a3;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation spotlight_l3_1

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"spotlight_l3_1" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[spotlight_l3_1 URLOfModelInThisBundle]();
    }
    v4 = 0;
  }

  return v4;
}

- (spotlight_l3_1)initWithMLModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)spotlight_l3_1;
  v6 = [(spotlight_l3_1 *)&v10 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model)) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (spotlight_l3_1)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(spotlight_l3_1 *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (spotlight_l3_1)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(spotlight_l3_1 *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (spotlight_l3_1)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(spotlight_l3_1 *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (spotlight_l3_1)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(spotlight_l3_1 *)self initWithMLModel:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 URLOfModelInThisBundle];
  [a1 loadContentsOfURL:v8 configuration:v7 completionHandler:v6];
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F1E968];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__spotlight_l3_1_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_1E634C800;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1E9E0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(spotlight_l3_1 *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(spotlight_l3_1 *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [spotlight_l3_1Output alloc];
    v13 = [v11 featureValueForName:@"y"];
    v14 = [v13 multiArrayValue];
    v15 = [v11 featureValueForName:@"id_features"];
    v16 = [v15 multiArrayValue];
    v17 = [(spotlight_l3_1Output *)v12 initWithY:v14 id_features:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(spotlight_l3_1 *)self model];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__spotlight_l3_1_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_1E634C828;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(spotlight_l3_1 *)self model];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__spotlight_l3_1_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_1E634C828;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromId_features:(id)a3 dense_features:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[spotlight_l3_1Input alloc] initWithId_features:v9 dense_features:v8];

  id v11 = [(spotlight_l3_1 *)self predictionFromFeatures:v10 error:a5];

  return v11;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v8];
  id v11 = [(spotlight_l3_1 *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count] >= 1)
    {
      v23 = v10;
      id v24 = v9;
      id v25 = v8;
      uint64_t v14 = 0;
      do
      {
        v15 = [v12 featuresAtIndex:v14];
        v16 = [spotlight_l3_1Output alloc];
        v17 = [v15 featureValueForName:@"y"];
        v18 = [v17 multiArrayValue];
        v19 = [v15 featureValueForName:@"id_features"];
        v20 = [v19 multiArrayValue];
        v21 = [(spotlight_l3_1Output *)v16 initWithY:v18 id_features:v20];

        [v13 addObject:v21];
        ++v14;
      }
      while (v14 < [v12 count]);
      id v9 = v24;
      id v8 = v25;
      id v10 = v23;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

+ (void)URLOfModelInThisBundle
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not load spotlight_l3_1.mlmodelc in the bundle resource", v0, 2u);
}

@end