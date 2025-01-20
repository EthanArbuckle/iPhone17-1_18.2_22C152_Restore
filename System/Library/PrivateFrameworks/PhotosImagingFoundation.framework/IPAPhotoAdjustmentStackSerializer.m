@interface IPAPhotoAdjustmentStackSerializer
- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4;
- (id)dataFromPhotoAdjustmentStack:(id)a3 error:(id *)a4;
- (id)photoAdjustmentStackFromData:(id)a3 error:(id *)a4;
@end

@implementation IPAPhotoAdjustmentStackSerializer

- (id)photoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAPhotoAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAPhotoAdjustmentStackSerializer *)v6 dataFromPhotoAdjustmentStack:v8 error:v9];
}

- (id)dataFromPhotoAdjustmentStack:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAPhotoAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAPhotoAdjustmentStackSerializer *)v6 _adjustmentStackFromData:v8 error:v9];
}

- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    SEL v7 = [(IPAPhotoAdjustmentStackSerializer *)self dataFromPhotoAdjustmentStack:v6 error:a4];

    return v7;
  }
  else
  {
    objc_opt_class();
    v9 = (IPAVideoAdjustmentStackSerializer *)_PFAssertFailHandler();
    return [(IPAVideoAdjustmentStackSerializer *)v9 videoAdjustmentStackFromData:v11 error:v12];
  }
}

@end