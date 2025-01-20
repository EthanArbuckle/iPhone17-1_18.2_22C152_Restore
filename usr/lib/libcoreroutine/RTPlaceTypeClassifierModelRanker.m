@interface RTPlaceTypeClassifierModelRanker
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (RTPlaceTypeClassifierModelRanker)init;
- (RTPlaceTypeClassifierModelRanker)initWithConfiguration:(id)a3 error:(id *)a4;
- (RTPlaceTypeClassifierModelRanker)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (RTPlaceTypeClassifierModelRanker)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (RTPlaceTypeClassifierModelRanker)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromMean_daily_longest_charging_duration_bucketed:(double)a3 mean_daily_longest_screen_lock_duration_bucketed:(double)a4 mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:(double)a5 mean_daily_total_charging_duration_bucketed:(double)a6 mean_daily_total_screen_lock_duration_bucketed:(double)a7 mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:(double)a8 mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:(double)a9 median_daily_longest_charging_duration_bucketed:(double)a10 median_daily_longest_screen_lock_duration_bucketed:(double)a11 median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:(double)a12 median_daily_total_charging_duration_bucketed:(double)a13 median_daily_total_screen_lock_duration_bucketed:(double)a14 median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:(double)a15 percentage_of_days_with_charging_bucketed:(double)a16 percentage_of_days_with_screen_lock_bucketed:(double)a17 percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:(double)a18 is_iPhone:(double)a19 is_iPad:(double)a20 is_Watch:(double)a21 error:(id *)a22;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation RTPlaceTypeClassifierModelRanker

+ (id)URLOfModelInThisBundle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"RTPlaceTypeClassifierModelRanker" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not load RTPlaceTypeClassifierModelRanker.mlmodelc in the bundle resource", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (RTPlaceTypeClassifierModelRanker)initWithMLModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTPlaceTypeClassifierModelRanker;
  v6 = [(RTPlaceTypeClassifierModelRanker *)&v10 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model)) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (RTPlaceTypeClassifierModelRanker)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(RTPlaceTypeClassifierModelRanker *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (RTPlaceTypeClassifierModelRanker)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(RTPlaceTypeClassifierModelRanker *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (RTPlaceTypeClassifierModelRanker)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(RTPlaceTypeClassifierModelRanker *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (RTPlaceTypeClassifierModelRanker)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(RTPlaceTypeClassifierModelRanker *)self initWithMLModel:v6];
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
  v10[2] = __86__RTPlaceTypeClassifierModelRanker_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_1E6B94420;
  id v11 = v7;
  id v9 = v7;
  [v8 loadContentsOfURL:a3 configuration:a4 completionHandler:v10];
}

void __86__RTPlaceTypeClassifierModelRanker_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[RTPlaceTypeClassifierModelRanker alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1E9E0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(RTPlaceTypeClassifierModelRanker *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(RTPlaceTypeClassifierModelRanker *)self model];
  id v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [RTPlaceTypeClassifierModelRankerOutput alloc];
    v13 = [v11 featureValueForName:@"target"];
    [v13 doubleValue];
    v14 = -[RTPlaceTypeClassifierModelRankerOutput initWithTarget:](v12, "initWithTarget:");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)predictionFromMean_daily_longest_charging_duration_bucketed:(double)a3 mean_daily_longest_screen_lock_duration_bucketed:(double)a4 mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:(double)a5 mean_daily_total_charging_duration_bucketed:(double)a6 mean_daily_total_screen_lock_duration_bucketed:(double)a7 mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:(double)a8 mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:(double)a9 median_daily_longest_charging_duration_bucketed:(double)a10 median_daily_longest_screen_lock_duration_bucketed:(double)a11 median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:(double)a12 median_daily_total_charging_duration_bucketed:(double)a13 median_daily_total_screen_lock_duration_bucketed:(double)a14 median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:(double)a15 percentage_of_days_with_charging_bucketed:(double)a16 percentage_of_days_with_screen_lock_bucketed:(double)a17 percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:(double)a18 is_iPhone:(double)a19 is_iPad:(double)a20 is_Watch:(double)a21 error:(id *)a22
{
  v24 = -[RTPlaceTypeClassifierModelRankerInput initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:]([RTPlaceTypeClassifierModelRankerInput alloc], "initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:", a3, a4, a5, a6, a7, a8, a9, a10, *(void *)&a11,
          *(void *)&a12,
          *(void *)&a13,
          *(void *)&a14,
          *(void *)&a15,
          *(void *)&a16,
          *(void *)&a17,
          *(void *)&a18,
          *(void *)&a19,
          *(void *)&a20,
          *(void *)&a21);
  v25 = [(RTPlaceTypeClassifierModelRanker *)self predictionFromFeatures:v24 error:a22];

  return v25;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v8];
  id v11 = [(RTPlaceTypeClassifierModelRanker *)self model];
  v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v12 count]];
    if ([v12 count] >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        v15 = [v12 featuresAtIndex:v14];
        v16 = [RTPlaceTypeClassifierModelRankerOutput alloc];
        v17 = [v15 featureValueForName:@"target"];
        [v17 doubleValue];
        v18 = -[RTPlaceTypeClassifierModelRankerOutput initWithTarget:](v16, "initWithTarget:");

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

@end