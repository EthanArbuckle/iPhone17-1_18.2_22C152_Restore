@interface backtap
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (backtap)init;
- (backtap)initWithConfiguration:(id)a3 error:(id *)a4;
- (backtap)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (backtap)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (backtap)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromModel_input:(id)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation backtap

+ (id)URLOfModelInThisBundle
{
  v10[2] = a1;
  v10[1] = (id)a2;
  id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10[0] = (id)[v6 pathForResource:@"backtap" ofType:@"mlmodelc"];

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
      _os_log_error_impl(&dword_2372C8000, log, type, "Could not load backtap.mlmodelc in the bundle resource", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    id v11 = 0;
  }
  objc_storeStrong(v10, 0);
  v2 = v11;
  return v2;
}

- (backtap)initWithMLModel:(id)a3
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
    v5.super_class = (Class)backtap;
    id v8 = [(backtap *)&v5 init];
    objc_storeStrong(&v8, v8);
    if (v8) {
      objc_storeStrong((id *)v8 + 1, location[0]);
    }
    v9 = (backtap *)v8;
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

- (backtap)init
{
  int v6 = self;
  id v4 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  int v6 = 0;
  int v6 = -[backtap initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  objc_super v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (backtap)initWithConfiguration:(id)a3 error:(id *)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v5 = v9;
  id v6 = (id)[(id)objc_opt_class() URLOfModelInThisBundle];
  v9 = 0;
  v9 = -[backtap initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (backtap)initWithContentsOfURL:(id)a3 error:(id *)a4
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
    v10 = (backtap *)v9;
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

- (backtap)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
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
    v13 = (backtap *)v12;
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
  v13 = __61__backtap_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_264CCE600;
  id v15 = v16;
  objc_msgSend(v9, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
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
  id v8 = -[backtap predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);
  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  v13[1] = a5;
  int v12 = [(backtap *)v16 model];
  v13[0] = [(MLModel *)v12 predictionFromFeatures:location[0] options:v14 error:a5];

  if (v13[0])
  {
    id v7 = [backtapOutput alloc];
    id v9 = (id)[v13[0] featureValueForName:@"model_output"];
    id v8 = (id)[v9 multiArrayValue];
    uint64_t v17 = [(backtapOutput *)v7 initWithModel_output:"initWithModel_output:"];
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  id v5 = (void *)v17;
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
  id v6 = [(backtap *)v15 model];
  id v5 = location[0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __52__backtap_predictionFromFeatures_completionHandler___block_invoke;
  int v11 = &unk_264CCE628;
  id v12 = v13;
  -[MLModel predictionFromFeatures:completionHandler:](v6, "predictionFromFeatures:completionHandler:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  int v9 = [(backtap *)v19 model];
  id v7 = location[0];
  id v8 = v17;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __60__backtap_predictionFromFeatures_options_completionHandler___block_invoke;
  id v14 = &unk_264CCE628;
  id v15 = v16;
  -[MLModel predictionFromFeatures:options:completionHandler:](v9, "predictionFromFeatures:options:completionHandler:", v7, v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromModel_input:(id)a3 error:(id *)a4
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8[1] = a4;
  id v4 = [backtapInput alloc];
  v8[0] = [(backtapInput *)v4 initWithModel_input:location[0]];
  id v7 = [(backtap *)v10 predictionFromFeatures:v8[0] error:a4];
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  v21[1] = a5;
  id v5 = objc_alloc(MEMORY[0x263F00D10]);
  v21[0] = (id)[v5 initWithFeatureProviderArray:location[0]];
  id v14 = [(backtap *)v24 model];
  id v20 = [(MLModel *)v14 predictionsFromBatch:v21[0] options:v22 error:a5];

  if (v20)
  {
    id v18 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v11 = i;
      if (v11 >= [v20 count]) {
        break;
      }
      id v16 = (id)[v20 featuresAtIndex:i];
      id v8 = [backtapOutput alloc];
      id v10 = (id)[v16 featureValueForName:@"model_output"];
      id v9 = (id)[v10 multiArrayValue];
      id v15 = [(backtapOutput *)v8 initWithModel_output:"initWithModel_output:"];

      [v18 addObject:v15];
      objc_storeStrong((id *)&v15, 0);
      objc_storeStrong(&v16, 0);
    }
    id v25 = v18;
    int v19 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v25 = 0;
    int v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  id v6 = v25;
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