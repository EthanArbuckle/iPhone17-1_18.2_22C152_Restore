@interface CRTextDetectorModelV3E5ML
+ (id)E5RTFunctionDescriptorWithError:(id *)a3;
+ (id)defaultURLOfModelInThisBundle;
- (CRTextDetectorModelV3E5ML)init;
- (CRTextDetectorModelV3E5ML)initWithConfiguration:(id)a3 error:(id *)a4;
- (CRTextDetectorModelV3E5ML)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (CRTextDetectorModelV3E5ML)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (id)createExecutionContext;
- (void)dealloc;
@end

@implementation CRTextDetectorModelV3E5ML

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

+ (id)E5RTFunctionDescriptorWithError:(id *)a3
{
  return 0;
}

- (CRTextDetectorModelV3E5ML)init
{
  v3 = [(id)objc_opt_class() defaultURLOfModelInThisBundle];
  if (v3)
  {
    self = [(CRTextDetectorModelV3E5ML *)self initWithContentsOfURL:v3 error:0];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CRTextDetectorModelV3E5ML)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CRTextDetectorModelV3E5ML;
  v5 = [(CRTextDetectorModelV3E5ML *)&v12 init];
  if (!v5) {
    goto LABEL_6;
  }
  v6 = CROSLogForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DD733000, v6, OS_LOG_TYPE_DEFAULT, "Loading detector model", v11, 2u);
  }

  uint64_t v7 = [(id)objc_opt_class() E5RTFunctionDescriptorWithError:a4];
  functionDescriptor = v5->_functionDescriptor;
  v5->_functionDescriptor = (VisionCoreE5RTInferenceFunctionDescriptor *)v7;

  if (v5->_functionDescriptor) {
    v9 = v5;
  }
  else {
LABEL_6:
  }
    v9 = 0;

  return v9;
}

- (CRTextDetectorModelV3E5ML)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() defaultURLOfModelInThisBundle];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [v6 customModelURL];

    if (v9)
    {
      uint64_t v10 = [v6 customModelURL];

      v8 = (void *)v10;
    }
    self = [(CRTextDetectorModelV3E5ML *)self initWithContentsOfURL:v8 configuration:v6 error:a4];

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

- (CRTextDetectorModelV3E5ML)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CRTextDetectorModelV3E5ML;
  id v6 = [(CRTextDetectorModelV3E5ML *)&v11 init];
  if (v6
    && ([(id)objc_opt_class() E5RTFunctionDescriptorWithError:a5],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        functionDescriptor = v6->_functionDescriptor,
        v6->_functionDescriptor = (VisionCoreE5RTInferenceFunctionDescriptor *)v7,
        functionDescriptor,
        v6->_functionDescriptor))
  {
    v9 = v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  v4.super_class = (Class)CRTextDetectorModelV3E5ML;
  [(CRTextDetectorModelV3E5ML *)&v4 dealloc];
}

- (id)createExecutionContext
{
  v2 = [(CRE5MLExecutionContext *)[CRTextDetectorModelV3E5MLExecutionContext alloc] initWithFunction:self->_functionDescriptor];
  return v2;
}

- (void).cxx_destruct
{
}

@end