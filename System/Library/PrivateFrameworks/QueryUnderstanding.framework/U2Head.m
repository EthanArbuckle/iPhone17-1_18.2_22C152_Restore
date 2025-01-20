@interface U2Head
+ (id)URLOfModelInThisBundle;
+ (void)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (U2Head)init;
- (U2Head)initWithConfiguration:(id)a3 error:(id *)a4;
- (U2Head)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (U2Head)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (U2Head)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromInput_mask:(id)a3 input_span_features:(id)a4 sequence_output:(id)a5 error:(id *)a6;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation U2Head

void __60__U2Head_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[U2Head alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (U2Head)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)U2Head;
    v6 = [(U2Head *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_model, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MLModel)model
{
  return self->_model;
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x263F00D80];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__U2Head_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_2654836F0;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"U2Head" ofType:@"mlmodelc"];

  if (v3)
  {
    id v4 = [NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[U2Head URLOfModelInThisBundle]();
    }
    id v4 = 0;
  }

  return v4;
}

- (U2Head)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  id v4 = [(U2Head *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (U2Head)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(U2Head *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (U2Head)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(U2Head *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (U2Head)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(U2Head *)self initWithMLModel:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
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

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263F00DC8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(U2Head *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(U2Head *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [U2HeadOutput alloc];
    v13 = [v11 featureValueForName:@"top_arg_ids"];
    v14 = [v13 multiArrayValue];
    v15 = [v11 featureValueForName:@"arg_conf_scores"];
    v16 = [v15 multiArrayValue];
    v17 = [v11 featureValueForName:@"intent_scores"];
    v18 = [v17 multiArrayValue];
    v19 = [v11 featureValueForName:@"safety_head_scores"];
    v20 = [v19 multiArrayValue];
    v21 = [(U2HeadOutput *)v12 initWithTop_arg_ids:v14 arg_conf_scores:v16 intent_scores:v18 safety_head_scores:v20];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(U2Head *)self model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__U2Head_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_265483718;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

void __51__U2Head_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [U2HeadOutput alloc];
    id v6 = [v18 featureValueForName:@"top_arg_ids"];
    id v7 = [v6 multiArrayValue];
    id v8 = [v18 featureValueForName:@"arg_conf_scores"];
    id v9 = [v8 multiArrayValue];
    objc_super v10 = [v18 featureValueForName:@"intent_scores"];
    id v11 = [v10 multiArrayValue];
    v12 = [v18 featureValueForName:@"safety_head_scores"];
    v13 = [v12 multiArrayValue];
    v14 = [(U2HeadOutput *)v5 initWithTop_arg_ids:v7 arg_conf_scores:v9 intent_scores:v11 safety_head_scores:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void (**)(uint64_t, void, U2HeadOutput *))(v15 + 16);
    v14 = a3;
    v16(v15, 0, v14);
  }
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(U2Head *)self model];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__U2Head_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_265483718;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

void __59__U2Head_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [U2HeadOutput alloc];
    id v6 = [v18 featureValueForName:@"top_arg_ids"];
    id v7 = [v6 multiArrayValue];
    id v8 = [v18 featureValueForName:@"arg_conf_scores"];
    id v9 = [v8 multiArrayValue];
    id v10 = [v18 featureValueForName:@"intent_scores"];
    id v11 = [v10 multiArrayValue];
    id v12 = [v18 featureValueForName:@"safety_head_scores"];
    v13 = [v12 multiArrayValue];
    id v14 = [(U2HeadOutput *)v5 initWithTop_arg_ids:v7 arg_conf_scores:v9 intent_scores:v11 safety_head_scores:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void (**)(uint64_t, void, U2HeadOutput *))(v15 + 16);
    id v14 = a3;
    v16(v15, 0, v14);
  }
}

- (id)predictionFromInput_mask:(id)a3 input_span_features:(id)a4 sequence_output:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[U2HeadInput alloc] initWithInput_mask:v12 input_span_features:v11 sequence_output:v10];

  id v14 = [(U2Head *)self predictionFromFeatures:v13 error:a6];

  return v14;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v8];
  id v11 = [(U2Head *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count] >= 1)
    {
      v26 = v10;
      id v27 = v9;
      id v28 = v8;
      v29 = v13;
      uint64_t v14 = 0;
      v30 = v12;
      do
      {
        uint64_t v15 = objc_msgSend(v12, "featuresAtIndex:", v14, v26, v27, v28);
        v16 = [U2HeadOutput alloc];
        v31 = [v15 featureValueForName:@"top_arg_ids"];
        id v17 = [v31 multiArrayValue];
        id v18 = [v15 featureValueForName:@"arg_conf_scores"];
        v19 = [v18 multiArrayValue];
        v20 = [v15 featureValueForName:@"intent_scores"];
        v21 = [v20 multiArrayValue];
        v22 = [v15 featureValueForName:@"safety_head_scores"];
        v23 = [v22 multiArrayValue];
        v24 = [(U2HeadOutput *)v16 initWithTop_arg_ids:v17 arg_conf_scores:v19 intent_scores:v21 safety_head_scores:v23];

        v13 = v29;
        id v12 = v30;

        [v29 addObject:v24];
        ++v14;
      }
      while (v14 < [v30 count]);
      id v9 = v27;
      id v8 = v28;
      id v10 = v26;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

+ (void)URLOfModelInThisBundle
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_25AC98000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Could not load U2Head.mlmodelc in the bundle resource", v0, 2u);
}

@end