@interface PXStoryColorNormalizationAutoAdjustment
- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3;
- (PXDisplayAsset)asset;
- (id)adjustmentSummary;
- (id)applyToImage:(id)a3 targetSize:(CGSize)a4;
- (void)setAsset:(id)a3;
@end

@implementation PXStoryColorNormalizationAutoAdjustment

- (void).cxx_destruct
{
}

- (void)setAsset:(id)a3
{
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (id)adjustmentSummary
{
  return @"on-demand";
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryColorNormalizationAutoAdjustment;
  if ([(PXStoryColorNormalizationAdjustment *)&v14 isEqualToDisplayAssetAdjustment:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      v7 = [(PXStoryColorNormalizationAutoAdjustment *)self asset];
      v8 = [v6 asset];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        BOOL v5 = 1;
      }
      else
      {
        BOOL v5 = 0;
        if (v9 && v10)
        {
          uint64_t v12 = [v9 isContentEqualTo:v10];
          if (!v12) {
            uint64_t v12 = [v11 isContentEqualTo:v9];
          }
          BOOL v5 = v12 == 2;
        }
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v20[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(PXStoryColorNormalizationAdjustment *)self filter];
  objc_sync_enter(v8);
  id v9 = [v8 inputNormalization];
  if (!v9)
  {
    [v8 setInputImage:v7];
    id v9 = [v8 outputNormalization];
    [v8 setInputNormalization:v9];
  }

  objc_sync_exit(v8);
  v18.receiver = self;
  v18.super_class = (Class)PXStoryColorNormalizationAutoAdjustment;
  id v10 = -[PXStoryColorNormalizationAdjustment applyToImage:targetSize:](&v18, sel_applyToImage_targetSize_, v7, width, height);

  if ([(PXStoryColorNormalizationAdjustment *)self useFalseColor])
  {
    v19[0] = @"inputRVector";
    v11 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
    v20[0] = v11;
    v19[1] = @"inputGVector";
    uint64_t v12 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:1.0 W:0.0];
    v20[1] = v12;
    v19[2] = @"inputBVector";
    v13 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
    v20[2] = v13;
    v19[3] = @"inputBiasVector";
    objc_super v14 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    v20[3] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
    uint64_t v16 = [v10 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v15];

    id v10 = (void *)v16;
  }

  return v10;
}

@end