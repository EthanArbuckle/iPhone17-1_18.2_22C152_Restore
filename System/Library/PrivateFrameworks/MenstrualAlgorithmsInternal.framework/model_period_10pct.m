@interface model_period_10pct
+ (id)URLOfModelInThisBundle;
+ (void)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromIn:(id)a3 lstm_1_h_in:(id)a4 lstm_1_c_in:(id)a5 error:(id *)a6;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (model_period_10pct)init;
- (model_period_10pct)initWithConfiguration:(id)a3 error:(id *)a4;
- (model_period_10pct)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (model_period_10pct)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (model_period_10pct)initWithMLModel:(id)a3;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation model_period_10pct

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"model_period_10pct" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[model_period_10pct URLOfModelInThisBundle]();
    }
    v4 = 0;
  }

  return v4;
}

- (model_period_10pct)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)model_period_10pct;
    v6 = [(model_period_10pct *)&v10 init];
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

- (model_period_10pct)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(model_period_10pct *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (model_period_10pct)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(model_period_10pct *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (model_period_10pct)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(model_period_10pct *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (model_period_10pct)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(model_period_10pct *)self initWithMLModel:v6];
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
  id v8 = (void *)MEMORY[0x263F00D80];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__model_period_10pct_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_2649FDA98;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263F00DC8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(model_period_10pct *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(model_period_10pct *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [model_period_10pctOutput alloc];
    v13 = [v11 featureValueForName:@"out"];
    v14 = [v13 multiArrayValue];
    v15 = [v11 featureValueForName:@"lstm_1_h_out"];
    v16 = [v15 multiArrayValue];
    v17 = [v11 featureValueForName:@"lstm_1_c_out"];
    v18 = [v17 multiArrayValue];
    v19 = [(model_period_10pctOutput *)v12 initWithOut:v14 lstm_1_h_out:v16 lstm_1_c_out:v18];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(model_period_10pct *)self model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__model_period_10pct_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_2649FDAC0;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(model_period_10pct *)self model];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__model_period_10pct_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_2649FDAC0;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromIn:(id)a3 lstm_1_h_in:(id)a4 lstm_1_c_in:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[model_period_10pctInput alloc] initWithIn:v12 lstm_1_h_in:v11 lstm_1_c_in:v10];

  id v14 = [(model_period_10pct *)self predictionFromFeatures:v13 error:a6];

  return v14;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v8];
  id v11 = [(model_period_10pct *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count] >= 1)
    {
      v26 = v10;
      id v27 = v9;
      id v28 = v8;
      v29 = v12;
      uint64_t v14 = 0;
      do
      {
        v15 = objc_msgSend(v12, "featuresAtIndex:", v14, v26, v27, v28);
        v16 = [model_period_10pctOutput alloc];
        [v15 featureValueForName:@"out"];
        v18 = v17 = v13;
        v19 = [v18 multiArrayValue];
        v20 = [v15 featureValueForName:@"lstm_1_h_out"];
        v21 = [v20 multiArrayValue];
        v22 = [v15 featureValueForName:@"lstm_1_c_out"];
        v23 = [v22 multiArrayValue];
        v24 = [(model_period_10pctOutput *)v16 initWithOut:v19 lstm_1_h_out:v21 lstm_1_c_out:v23];

        v13 = v17;
        id v12 = v29;
        [v13 addObject:v24];

        ++v14;
      }
      while (v14 < [v29 count]);
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
  _os_log_error_impl(&dword_22F10E000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load model_period_10pct.mlmodelc in the bundle resource", v0, 2u);
}

@end