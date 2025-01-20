@interface engageOnPlugin
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (engageOnPlugin)init;
- (engageOnPlugin)initWithConfiguration:(id)a3 error:(id *)a4;
- (engageOnPlugin)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (engageOnPlugin)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (engageOnPlugin)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromPlugin_battery_level:(double)a3 time_from_plugin:(double)a4 med_dur_1:(double)a5 med_dur_2:(double)a6 med_dur_4:(double)a7 med_dur_8:(double)a8 med_dur_16:(double)a9 med_dur_24:(double)a10 cnt_dur_1:(double)a11 cnt_dur_2:(double)a12 cnt_dur_4:(double)a13 cnt_dur_8:(double)a14 cnt_dur_16:(double)a15 cnt_dur_24:(double)a16 std_dur_1:(double)a17 std_dur_2:(double)a18 std_dur_4:(double)a19 std_dur_8:(double)a20 std_dur_16:(double)a21 std_dur_24:(double)a22 weekday_med_dur_1:(double)a23 weekday_med_dur_2:(double)a24 weekday_med_dur_4:(double)a25 weekday_med_dur_8:(double)a26 weekday_med_dur_24:(double)a27 weekday_std_dur_4:(double)a28 error:(id *)a29;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation engageOnPlugin

+ (id)URLOfModelInThisBundle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"engageOnPlugin" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = +[NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100043E30();
    }
    v4 = 0;
  }

  return v4;
}

- (engageOnPlugin)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)engageOnPlugin;
    v6 = [(engageOnPlugin *)&v10 init];
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

- (engageOnPlugin)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(engageOnPlugin *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (engageOnPlugin)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(engageOnPlugin *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (engageOnPlugin)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = +[MLModel modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(engageOnPlugin *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (engageOnPlugin)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = +[MLModel modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(engageOnPlugin *)self initWithMLModel:v6];
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
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039D6C;
  v8[3] = &unk_1000652D0;
  id v9 = a5;
  id v7 = v9;
  +[MLModel loadContentsOfURL:a3 configuration:a4 completionHandler:v8];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MLPredictionOptions);
  id v8 = [(engageOnPlugin *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(engageOnPlugin *)self model];
  v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [engageOnPluginOutput alloc];
    v13 = [v11 featureValueForName:@"engage"];
    id v14 = [v13 int64Value];
    v15 = [v11 featureValueForName:@"classProbability"];
    v16 = [v15 dictionaryValue];
    v17 = [(engageOnPluginOutput *)v12 initWithEngage:v14 classProbability:v16];
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
  id v8 = [(engageOnPlugin *)self model];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003A064;
  v10[3] = &unk_1000652F8;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(engageOnPlugin *)self model];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003A26C;
  v13[3] = &unk_1000652F8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromPlugin_battery_level:(double)a3 time_from_plugin:(double)a4 med_dur_1:(double)a5 med_dur_2:(double)a6 med_dur_4:(double)a7 med_dur_8:(double)a8 med_dur_16:(double)a9 med_dur_24:(double)a10 cnt_dur_1:(double)a11 cnt_dur_2:(double)a12 cnt_dur_4:(double)a13 cnt_dur_8:(double)a14 cnt_dur_16:(double)a15 cnt_dur_24:(double)a16 std_dur_1:(double)a17 std_dur_2:(double)a18 std_dur_4:(double)a19 std_dur_8:(double)a20 std_dur_16:(double)a21 std_dur_24:(double)a22 weekday_med_dur_1:(double)a23 weekday_med_dur_2:(double)a24 weekday_med_dur_4:(double)a25 weekday_med_dur_8:(double)a26 weekday_med_dur_24:(double)a27 weekday_std_dur_4:(double)a28 error:(id *)a29
{
  v31 = -[engageOnPluginInput initWithPlugin_battery_level:time_from_plugin:med_dur_1:med_dur_2:med_dur_4:med_dur_8:med_dur_16:med_dur_24:cnt_dur_1:cnt_dur_2:cnt_dur_4:cnt_dur_8:cnt_dur_16:cnt_dur_24:std_dur_1:std_dur_2:std_dur_4:std_dur_8:std_dur_16:std_dur_24:weekday_med_dur_1:weekday_med_dur_2:weekday_med_dur_4:weekday_med_dur_8:weekday_med_dur_24:weekday_std_dur_4:]([engageOnPluginInput alloc], "initWithPlugin_battery_level:time_from_plugin:med_dur_1:med_dur_2:med_dur_4:med_dur_8:med_dur_16:med_dur_24:cnt_dur_1:cnt_dur_2:cnt_dur_4:cnt_dur_8:cnt_dur_16:cnt_dur_24:std_dur_1:std_dur_2:std_dur_4:std_dur_8:std_dur_16:std_dur_24:weekday_med_dur_1:weekday_med_dur_2:weekday_med_dur_4:weekday_med_dur_8:weekday_med_dur_24:weekday_std_dur_4:", a3, a4, a5, a6, a7, a8, a9, a10, *(void *)&a11, *(void *)&a12, *(void *)&a13, *(void *)&a14, *(void *)&a15, *(void *)&a16, *(void *)&a17,
          *(void *)&a18,
          *(void *)&a19,
          *(void *)&a20,
          *(void *)&a21,
          *(void *)&a22,
          *(void *)&a23,
          *(void *)&a24,
          *(void *)&a25,
          *(void *)&a26,
          *(void *)&a27,
          *(void *)&a28);
  v32 = [(engageOnPlugin *)self predictionFromFeatures:v31 error:a29];

  return v32;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)MLArrayBatchProvider) initWithFeatureProviderArray:v8];
  id v11 = [(engageOnPlugin *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    if ((uint64_t)[v12 count] >= 1)
    {
      id v23 = v10;
      id v24 = v9;
      id v25 = v8;
      uint64_t v14 = 0;
      do
      {
        v15 = [v12 featuresAtIndex:v14];
        v16 = [engageOnPluginOutput alloc];
        v17 = [v15 featureValueForName:@"engage"];
        id v18 = [v17 int64Value];
        v19 = [v15 featureValueForName:@"classProbability"];
        v20 = [v19 dictionaryValue];
        v21 = [(engageOnPluginOutput *)v16 initWithEngage:v18 classProbability:v20];

        [v13 addObject:v21];
        ++v14;
      }
      while (v14 < (uint64_t)[v12 count]);
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

@end