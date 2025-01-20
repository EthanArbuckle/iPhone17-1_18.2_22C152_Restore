@interface IPAVideoAdjustmentStackSerializer
- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4;
- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4;
- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4;
@end

@implementation IPAVideoAdjustmentStackSerializer

- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAVideoAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAVideoAdjustmentStackSerializer *)v6 dataFromVideoAdjustmentStack:v8 error:v9];
}

- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAVideoAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAVideoAdjustmentStackSerializer *)v6 _adjustmentStackFromData:v8 error:v9];
}

- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    SEL v7 = [(IPAVideoAdjustmentStackSerializer *)self dataFromVideoAdjustmentStack:v6 error:a4];

    return v7;
  }
  else
  {
    objc_opt_class();
    v9 = (void *)_PFAssertFailHandler();
    return +[IPAAdjustmentStackSerializer propertyListFromData:v11 error:v12];
  }
}

@end