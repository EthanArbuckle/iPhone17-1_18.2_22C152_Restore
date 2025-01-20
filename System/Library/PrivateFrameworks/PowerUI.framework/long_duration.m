@interface long_duration
+ (id)URLOfModelInThisBundle;
+ (void)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (id)predictionFromClassic_time_between_uses_med_dur_1:(double)a3 classic_time_between_uses_med_dur_2:(double)a4 classic_time_between_uses_med_dur_4:(double)a5 classic_time_between_uses_med_dur_24:(double)a6 classic_time_between_uses_std_dur_1:(double)a7 classic_time_between_uses_std_dur_2:(double)a8 classic_time_between_uses_std_dur_4:(double)a9 classic_time_between_uses_std_dur_24:(double)a10 hour:(double)a11 is_weekend:(double)a12 hour_plus_0:(double)a13 hour_plus_1:(double)a14 hour_plus_2:(double)a15 hour_plus_3:(double)a16 hour_plus_4:(double)a17 hour_plus_5:(double)a18 hours_until_use:(double)a19 meaningful_undercharge_rolling_average:(double)a20 error:(id *)a21;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (long_duration)init;
- (long_duration)initWithConfiguration:(id)a3 error:(id *)a4;
- (long_duration)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (long_duration)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (long_duration)initWithMLModel:(id)a3;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation long_duration

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"long_duration" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[long_duration URLOfModelInThisBundle]();
    }
    v4 = 0;
  }

  return v4;
}

- (long_duration)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)long_duration;
    v6 = [(long_duration *)&v10 init];
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

- (long_duration)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(long_duration *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (long_duration)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(long_duration *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (long_duration)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(long_duration *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (long_duration)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x263F00D80] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(long_duration *)self initWithMLModel:v6];
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
  v10[2] = __67__long_duration_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_2645A6F98;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263F00DC8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(long_duration *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(long_duration *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [long_durationOutput alloc];
    v13 = [v11 featureValueForName:@"duration_pred"];
    [v13 doubleValue];
    v14 = -[long_durationOutput initWithDuration_pred:](v12, "initWithDuration_pred:");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(long_duration *)self model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__long_duration_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_2645A6FC0;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(long_duration *)self model];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__long_duration_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_2645A6FC0;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromClassic_time_between_uses_med_dur_1:(double)a3 classic_time_between_uses_med_dur_2:(double)a4 classic_time_between_uses_med_dur_4:(double)a5 classic_time_between_uses_med_dur_24:(double)a6 classic_time_between_uses_std_dur_1:(double)a7 classic_time_between_uses_std_dur_2:(double)a8 classic_time_between_uses_std_dur_4:(double)a9 classic_time_between_uses_std_dur_24:(double)a10 hour:(double)a11 is_weekend:(double)a12 hour_plus_0:(double)a13 hour_plus_1:(double)a14 hour_plus_2:(double)a15 hour_plus_3:(double)a16 hour_plus_4:(double)a17 hour_plus_5:(double)a18 hours_until_use:(double)a19 meaningful_undercharge_rolling_average:(double)a20 error:(id *)a21
{
  v23 = -[long_durationInput initWithClassic_time_between_uses_med_dur_1:classic_time_between_uses_med_dur_2:classic_time_between_uses_med_dur_4:classic_time_between_uses_med_dur_24:classic_time_between_uses_std_dur_1:classic_time_between_uses_std_dur_2:classic_time_between_uses_std_dur_4:classic_time_between_uses_std_dur_24:hour:is_weekend:hour_plus_0:hour_plus_1:hour_plus_2:hour_plus_3:hour_plus_4:hour_plus_5:hours_until_use:meaningful_undercharge_rolling_average:]([long_durationInput alloc], "initWithClassic_time_between_uses_med_dur_1:classic_time_between_uses_med_dur_2:classic_time_between_uses_med_dur_4:classic_time_between_uses_med_dur_24:classic_time_between_uses_std_dur_1:classic_time_between_uses_std_dur_2:classic_time_between_uses_std_dur_4:classic_time_between_uses_std_dur_24:hour:is_weekend:hour_plus_0:hour_plus_1:hour_plus_2:hour_plus_3:hour_plus_4:hour_plus_5:hours_until_use:meaningful_undercharge_rolling_average:", a3, a4, a5, a6, a7, a8, a9, a10, *(void *)&a11, *(void *)&a12, *(void *)&a13, *(void *)&a14, *(void *)&a15, *(void *)&a16,
          *(void *)&a17,
          *(void *)&a18,
          *(void *)&a19,
          *(void *)&a20);
  v24 = [(long_duration *)self predictionFromFeatures:v23 error:a21];

  return v24;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v8];
  id v11 = [(long_duration *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count] >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        v15 = [v12 featuresAtIndex:v14];
        v16 = [long_durationOutput alloc];
        v17 = [v15 featureValueForName:@"duration_pred"];
        [v17 doubleValue];
        v18 = -[long_durationOutput initWithDuration_pred:](v16, "initWithDuration_pred:");

        [v13 addObject:v18];
        ++v14;
      }
      while (v14 < [v12 count]);
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
  _os_log_error_impl(&dword_22135E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Could not load long_duration.mlmodelc in the bundle resource", v0, 2u);
}

@end