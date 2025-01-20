@interface BackTapRNN
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (BackTapRNN)init;
- (BackTapRNN)initWithConfiguration:(id)a3 error:(id *)a4;
- (BackTapRNN)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BackTapRNN)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (BackTapRNN)initWithMLModel:(id)a3;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromModel_input:(id)a3 history:(id)a4 error:(id *)a5;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation BackTapRNN

+ (id)URLOfModelInThisBundle
{
  v10[2] = a1;
  v10[1] = (id)a2;
  id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10[0] = (id)[v6 pathForResource:@"BackTapRNN" ofType:@"mlmodelc"];

  if (v10[0])
  {
    id v11 = (id)[NSURL fileURLWithPath:v10[0]];
  }
  else
  {
    id location = &_os_log_internal;
    char v8 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_error_impl(&dword_2372C8000, log, type, "Could not load BackTapRNN.mlmodelc in the bundle resource", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    id v11 = 0;
  }
  objc_storeStrong(v10, 0);
  v2 = v11;
  return v2;
}

- (BackTapRNN)initWithMLModel:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v3 = v8;
    id v8 = 0;
    v5.receiver = v3;
    v5.super_class = (Class)BackTapRNN;
    id v8 = [(BackTapRNN *)&v5 init];
    objc_storeStrong(&v8, v8);
    if (v8) {
      objc_storeStrong((id *)v8 + 1, location[0]);
    }
    v9 = (BackTapRNN *)v8;
    int v6 = 1;
  }
  else
  {
    v9 = 0;
    int v6 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v9;
}

- (BackTapRNN)init
{
  int v6 = self;
  id v4 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  int v6 = 0;
  int v6 = -[BackTapRNN initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  objc_super v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (BackTapRNN)initWithConfiguration:(id)a3 error:(id *)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v5 = v9;
  id v6 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  v9 = 0;
  v9 = -[BackTapRNN initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (BackTapRNN)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:location[0] error:a4];
  if (v7[0])
  {
    id v4 = v9;
    id v9 = 0;
    id v9 = (id)[v4 initWithMLModel:v7[0]];
    v10 = (BackTapRNN *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (BackTapRNN)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = a5;
  v9[0] = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:location[0] configuration:v10 error:a5];
  if (v9[0])
  {
    id v5 = v12;
    id v12 = 0;
    id v12 = (id)[v5 initWithMLModel:v9[0]];
    v13 = (BackTapRNN *)v12;
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v13;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = v9;
  id v6 = (id)[v9 URLOfModelInThisBundle];
  objc_msgSend(v5, "loadContentsOfURL:configuration:completionHandler:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v9 = (void *)MEMORY[0x263F00D80];
  id v7 = location[0];
  id v8 = v17;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  v13 = __64__BackTapRNN_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_264CCE600;
  id v15 = v16;
  objc_msgSend(v9, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __64__BackTapRNN_loadContentsOfURL_configuration_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (location[0])
  {
    id v3 = [BackTapRNN alloc];
    v6[0] = [(BackTapRNN *)v3 initWithMLModel:location[0]];
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v6, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = v10;
  id v5 = location[0];
  id v7 = objc_alloc_init(MEMORY[0x263F00DC8]);
  id v8 = -[BackTapRNN predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);
  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  v15[1] = a5;
  v14 = [(BackTapRNN *)v18 model];
  v15[0] = [(MLModel *)v14 predictionFromFeatures:location[0] options:v16 error:a5];

  if (v15[0])
  {
    id v7 = [BackTapRNNOutput alloc];
    id v11 = (id)[v15[0] featureValueForName:@"output"];
    id v10 = (id)[v11 multiArrayValue];
    id v9 = (id)[v15[0] featureValueForName:@"updated_history"];
    id v8 = (id)[v9 multiArrayValue];
    uint64_t v19 = -[BackTapRNNOutput initWithOutput:updated_history:](v7, "initWithOutput:updated_history:", v10);
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  id v5 = (void *)v19;
  return v5;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v6 = [(BackTapRNN *)v15 model];
  id v5 = location[0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __55__BackTapRNN_predictionFromFeatures_completionHandler___block_invoke;
  id v11 = &unk_264CCE628;
  id v12 = v13;
  -[MLModel predictionFromFeatures:completionHandler:](v6, "predictionFromFeatures:completionHandler:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __55__BackTapRNN_predictionFromFeatures_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v11 = 0;
  objc_storeStrong(&v11, a3);
  v10[1] = a1;
  if (location[0])
  {
    id v3 = [BackTapRNNOutput alloc];
    id v7 = (id)[location[0] featureValueForName:@"output"];
    id v6 = (id)[v7 multiArrayValue];
    id v5 = (id)[location[0] featureValueForName:@"updated_history"];
    id v4 = (id)[v5 multiArrayValue];
    v10[0] = -[BackTapRNNOutput initWithOutput:updated_history:](v3, "initWithOutput:updated_history:", v6);

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v10, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  int v9 = [(BackTapRNN *)v19 model];
  id v7 = location[0];
  id v8 = v17;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __63__BackTapRNN_predictionFromFeatures_options_completionHandler___block_invoke;
  v14 = &unk_264CCE628;
  id v15 = v16;
  -[MLModel predictionFromFeatures:options:completionHandler:](v9, "predictionFromFeatures:options:completionHandler:", v7, v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __63__BackTapRNN_predictionFromFeatures_options_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v11 = 0;
  objc_storeStrong(&v11, a3);
  v10[1] = a1;
  if (location[0])
  {
    id v3 = [BackTapRNNOutput alloc];
    id v7 = (id)[location[0] featureValueForName:@"output"];
    id v6 = (id)[v7 multiArrayValue];
    id v5 = (id)[location[0] featureValueForName:@"updated_history"];
    id v4 = (id)[v5 multiArrayValue];
    v10[0] = -[BackTapRNNOutput initWithOutput:updated_history:](v3, "initWithOutput:updated_history:", v6);

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v10, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromModel_input:(id)a3 history:(id)a4 error:(id *)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a5;
  id v5 = [BackTapRNNInput alloc];
  v10[0] = [(BackTapRNNInput *)v5 initWithModel_input:location[0] history:v11];
  id v9 = [(BackTapRNN *)v13 predictionFromFeatures:v10[0] error:a5];
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  v23[1] = a5;
  id v5 = objc_alloc(MEMORY[0x263F00D10]);
  v23[0] = (id)[v5 initWithFeatureProviderArray:location[0]];
  id v16 = [(BackTapRNN *)v26 model];
  id v22 = [(MLModel *)v16 predictionsFromBatch:v23[0] options:v24 error:a5];

  if (v22)
  {
    id v20 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v22, "count"));
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v13 = i;
      if (v13 >= [v22 count]) {
        break;
      }
      id v18 = (id)[v22 featuresAtIndex:i];
      id v8 = [BackTapRNNOutput alloc];
      id v12 = (id)[v18 featureValueForName:@"output"];
      id v11 = (id)[v12 multiArrayValue];
      id v10 = (id)[v18 featureValueForName:@"updated_history"];
      id v9 = (id)[v10 multiArrayValue];
      id v17 = -[BackTapRNNOutput initWithOutput:updated_history:](v8, "initWithOutput:updated_history:", v11);

      [v20 addObject:v17];
      objc_storeStrong((id *)&v17, 0);
      objc_storeStrong(&v18, 0);
    }
    id v27 = v20;
    int v21 = 1;
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v27 = 0;
    int v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  id v6 = v27;
  return v6;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end