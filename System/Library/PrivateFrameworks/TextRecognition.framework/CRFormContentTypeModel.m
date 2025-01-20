@interface CRFormContentTypeModel
+ (id)defaultURLOfModelInThisBundle;
- (CRFormContentTypeModel)init;
- (CRFormContentTypeModel)initWithConfiguration:(id)a3 error:(id *)a4;
- (CRFormContentTypeModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (CRFormContentTypeModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation CRFormContentTypeModel

+ (id)defaultURLOfModelInThisBundle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"cr_form_ct_v2.mlmodelc" ofType:@"bundle"];
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];

  return v4;
}

- (CRFormContentTypeModel)init
{
  v3 = [(id)objc_opt_class() defaultURLOfModelInThisBundle];
  v4 = [(CRFormContentTypeModel *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (CRFormContentTypeModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRFormContentTypeModel;
  v7 = [(CRFormContentTypeModel *)&v12 init];
  if (v7
    && ([MEMORY[0x1E4F1E968] modelWithContentsOfURL:v6 error:a4],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        model = v7->_model,
        v7->_model = (MLModel *)v8,
        model,
        !v7->_model))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (CRFormContentTypeModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() defaultURLOfModelInThisBundle];
  uint64_t v8 = [v6 customModelURL];

  if (v8)
  {
    uint64_t v9 = [v6 customModelURL];

    v7 = (void *)v9;
  }
  v10 = [(CRFormContentTypeModel *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v10;
}

- (CRFormContentTypeModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRFormContentTypeModel;
  v10 = [(CRFormContentTypeModel *)&v16 init];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1E990]);
    [v11 setAllowLowPrecisionAccumulationOnGPU:1];
    objc_msgSend(v11, "setComputeUnits:", +[CRComputeDeviceUtilities mlComputeUnitFromComputeDeviceType:](CRComputeDeviceUtilities, "mlComputeUnitFromComputeDeviceType:", objc_msgSend(v9, "computeDeviceType")));
    if ([v11 computeUnits] == 1
      || (deviceHasAppleNeuralEngine() & 1) == 0 && [v11 computeUnits])
    {
      [v11 setAllowBackgroundGPUCompute:1];
    }
    uint64_t v12 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v11 error:a5];
    model = v10->_model;
    v10->_model = (MLModel *)v12;

    if (v10->_model) {
      v14 = v10;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1E9E0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(CRFormContentTypeModel *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v5 = [(MLModel *)self->_model predictionFromFeatures:a3 options:a4 error:a5];
  id v6 = [CRFormContentTypeModelOutput alloc];
  id v7 = [v5 featureValueForName:@"score"];
  id v8 = [v7 multiArrayValue];
  id v9 = [(CRFormContentTypeModelOutput *)v6 initWithScore:v8];

  return v9;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v8];
  id v11 = [(MLModel *)self->_model predictionsFromBatch:v10 options:v9 error:a5];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  if ([v11 count] >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      v14 = [v11 featuresAtIndex:v13];
      v15 = [v14 featureValueForName:@"score"];
      objc_super v16 = [v15 multiArrayValue];

      v17 = [[CRFormContentTypeModelOutput alloc] initWithScore:v16];
      [v12 addObject:v17];

      ++v13;
    }
    while (v13 < [v11 count]);
  }

  return v12;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end