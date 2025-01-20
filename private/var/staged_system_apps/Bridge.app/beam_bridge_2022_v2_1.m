@interface beam_bridge_2022_v2_1
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (beam_bridge_2022_v2_1)init;
- (beam_bridge_2022_v2_1)initWithConfiguration:(id)a3 error:(id *)a4;
- (beam_bridge_2022_v2_1)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (beam_bridge_2022_v2_1)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (beam_bridge_2022_v2_1)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromImage_Placeholder:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation beam_bridge_2022_v2_1

+ (id)URLOfModelInThisBundle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"beam_bridge_2022_v2_1" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = +[NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1001754E8();
    }
    v4 = 0;
  }

  return v4;
}

- (beam_bridge_2022_v2_1)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)beam_bridge_2022_v2_1;
    v6 = [(beam_bridge_2022_v2_1 *)&v10 init];
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

- (beam_bridge_2022_v2_1)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(beam_bridge_2022_v2_1 *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (beam_bridge_2022_v2_1)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(beam_bridge_2022_v2_1 *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (beam_bridge_2022_v2_1)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = +[MLModel modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(beam_bridge_2022_v2_1 *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (beam_bridge_2022_v2_1)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = +[MLModel modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(beam_bridge_2022_v2_1 *)self initWithMLModel:v6];
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
  v8[2] = sub_100132D34;
  v8[3] = &unk_100247E90;
  id v9 = a5;
  id v7 = v9;
  +[MLModel loadContentsOfURL:a3 configuration:a4 completionHandler:v8];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MLPredictionOptions);
  id v8 = [(beam_bridge_2022_v2_1 *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(beam_bridge_2022_v2_1 *)self model];
  v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [beam_bridge_2022_v2_1Output alloc];
    v13 = [v11 featureValueForName:@"cell_leaf_fully_connected_BiasAdd"];
    v14 = [v13 multiArrayValue];
    v15 = [v11 featureValueForName:@"leaf_leaf_predictions_probabilities"];
    v16 = [v15 multiArrayValue];
    v17 = [(beam_bridge_2022_v2_1Output *)v12 initWithCell_leaf_fully_connected_BiasAdd:v14 leaf_leaf_predictions_probabilities:v16];
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
  id v8 = [(beam_bridge_2022_v2_1 *)self model];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100133034;
  v10[3] = &unk_100247EB8;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(beam_bridge_2022_v2_1 *)self model];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100133244;
  v13[3] = &unk_100247EB8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromImage_Placeholder:(__CVBuffer *)a3 error:(id *)a4
{
  id v6 = [[beam_bridge_2022_v2_1Input alloc] initWithImage_Placeholder:a3];
  id v7 = [(beam_bridge_2022_v2_1 *)self predictionFromFeatures:v6 error:a4];

  return v7;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)MLArrayBatchProvider) initWithFeatureProviderArray:v8];
  id v11 = [(beam_bridge_2022_v2_1 *)self model];
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
        v16 = [beam_bridge_2022_v2_1Output alloc];
        v17 = [v15 featureValueForName:@"cell_leaf_fully_connected_BiasAdd"];
        v18 = [v17 multiArrayValue];
        v19 = [v15 featureValueForName:@"leaf_leaf_predictions_probabilities"];
        v20 = [v19 multiArrayValue];
        v21 = [(beam_bridge_2022_v2_1Output *)v16 initWithCell_leaf_fully_connected_BiasAdd:v18 leaf_leaf_predictions_probabilities:v20];

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