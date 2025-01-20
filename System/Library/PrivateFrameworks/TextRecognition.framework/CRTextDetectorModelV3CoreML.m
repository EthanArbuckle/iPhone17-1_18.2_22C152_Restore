@interface CRTextDetectorModelV3CoreML
+ (id)defaultURLOfModelInThisBundle;
- (CRTextDetectorModelV3CoreML)init;
- (CRTextDetectorModelV3CoreML)initWithConfiguration:(id)a3 error:(id *)a4;
- (CRTextDetectorModelV3CoreML)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (CRTextDetectorModelV3CoreML)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (MLModel)model;
- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation CRTextDetectorModelV3CoreML

+ (id)defaultURLOfModelInThisBundle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"cr_td_model_v3.mlmodelc" ofType:@"bundle"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    v5 = CROSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DD733000, v5, OS_LOG_TYPE_FAULT, "Could not get detector path!", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (CRTextDetectorModelV3CoreML)init
{
  v3 = [(id)objc_opt_class() defaultURLOfModelInThisBundle];
  if (v3)
  {
    self = [(CRTextDetectorModelV3CoreML *)self initWithContentsOfURL:v3 error:0];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CRTextDetectorModelV3CoreML)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRTextDetectorModelV3CoreML;
  v7 = [(CRTextDetectorModelV3CoreML *)&v14 init];
  if (!v7) {
    goto LABEL_6;
  }
  v8 = CROSLogForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_DEFAULT, "Loading detector model", v13, 2u);
  }

  uint64_t v9 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v6 error:a4];
  model = v7->_model;
  v7->_model = (MLModel *)v9;

  if (v7->_model) {
    v11 = v7;
  }
  else {
LABEL_6:
  }
    v11 = 0;

  return v11;
}

- (void)dealloc
{
  v3 = CROSLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD733000, v3, OS_LOG_TYPE_DEFAULT, "Unloading detector model", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CRTextDetectorModelV3CoreML;
  [(CRTextDetectorModelV3CoreML *)&v4 dealloc];
}

- (CRTextDetectorModelV3CoreML)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() defaultURLOfModelInThisBundle];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [v6 customModelURL];

    if (v9)
    {
      uint64_t v10 = [v6 customModelURL];

      v8 = (void *)v10;
    }
    self = [(CRTextDetectorModelV3CoreML *)self initWithContentsOfURL:v8 configuration:v6 error:a4];

    v11 = self;
  }
  else if (a4)
  {
    +[CRImageReader errorWithErrorCode:-8];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CRTextDetectorModelV3CoreML)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRTextDetectorModelV3CoreML;
  uint64_t v10 = [(CRTextDetectorModelV3CoreML *)&v19 init];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1E990]);
    [v11 setAllowLowPrecisionAccumulationOnGPU:1];
    if (deviceHasAppleNeuralEngine()) {
      int64_t v12 = 2;
    }
    else {
      int64_t v12 = +[CRComputeDeviceUtilities mlComputeUnitFromComputeDeviceType:](CRComputeDeviceUtilities, "mlComputeUnitFromComputeDeviceType:", [v9 computeDeviceType]);
    }
    [v11 setComputeUnits:v12];
    if ([v11 computeUnits] == 1
      || (deviceHasAppleNeuralEngine() & 1) == 0 && [v11 computeUnits])
    {
      [v11 setAllowBackgroundGPUCompute:1];
      objc_super v14 = [v9 metalDevice];

      if (v14)
      {
        v15 = [v9 metalDevice];
        [v11 setPreferredMetalDevice:v15];
      }
    }
    uint64_t v16 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v11 error:a5];
    model = v10->_model;
    v10->_model = (MLModel *)v16;

    if (v10->_model) {
      v13 = v10;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4
{
  id v6 = [[CRTextDetectorModelV3Input alloc] initWithImg_input:a3];
  model = self->_model;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1E9E0]);
  id v9 = [(MLModel *)model predictionFromFeatures:v6 options:v8 error:a4];

  if (v9)
  {
    v24 = [CRTextDetectorModelV3Output alloc];
    v27 = [v9 featureValueForName:@"region_score"];
    v20 = [v27 multiArrayValue];
    v26 = [v9 featureValueForName:@"script_feature"];
    v21 = [v26 multiArrayValue];
    v25 = [v9 featureValueForName:@"link_score_horizontal"];
    objc_super v19 = [v25 multiArrayValue];
    v23 = [v9 featureValueForName:@"link_score_vertical"];
    uint64_t v10 = [v23 multiArrayValue];
    id v11 = [v9 featureValueForName:@"orientation_score"];
    int64_t v12 = [v11 multiArrayValue];
    v13 = [v9 featureValueForName:@"text_type_score"];
    [v13 multiArrayValue];
    objc_super v14 = v22 = v6;
    v15 = [v9 featureValueForName:@"table_score"];
    uint64_t v16 = [v15 multiArrayValue];
    v17 = [(CRTextDetectorModelV3Output *)v24 initWithRegion_score:v20 script_feature:v21 link_score_horizontal:v19 link_score_vertical:v10 orientation_score:v12 text_type_score:v14 table_score:v16];

    id v6 = v22;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end