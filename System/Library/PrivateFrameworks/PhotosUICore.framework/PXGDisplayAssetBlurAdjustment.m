@interface PXGDisplayAssetBlurAdjustment
- (BOOL)allowsUnadjustedOpportunisticDelivery;
- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3;
- (BOOL)wantsSingleHighQualityDelivery;
- (CGSize)requestSizeForProposedTargetSize:(CGSize)a3;
- (PXGDisplayAssetBlurAdjustment)initWithBlurRadius:(double)a3 darkeningOverlayOpacity:(double)a4;
- (double)blurRadius;
- (double)darkeningOverlayOpacity;
- (id)applyToImage:(id)a3 targetSize:(CGSize)a4;
- (int64_t)contentModeForProposedContentMode:(int64_t)a3;
- (unint64_t)hash;
@end

@implementation PXGDisplayAssetBlurAdjustment

- (double)darkeningOverlayOpacity
{
  return self->_darkeningOverlayOpacity;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 1;
}

- (CGSize)requestSizeForProposedTargetSize:(CGSize)a3
{
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 1;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 1;
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 blurRadius];
    double v6 = v5;
    [(PXGDisplayAssetBlurAdjustment *)self blurRadius];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 imageByClampingToExtent];
  double v7 = [MEMORY[0x1E4F1E040] filterWithName:@"CIGaussianBlur"];
  uint64_t v8 = *MEMORY[0x1E4F1E480];
  [v7 setValue:v6 forKey:*MEMORY[0x1E4F1E480]];
  v9 = NSNumber;
  [(PXGDisplayAssetBlurAdjustment *)self blurRadius];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v7 setValue:v10 forKey:*MEMORY[0x1E4F1E4E0]];

  id v11 = [v7 outputImage];
  [(PXGDisplayAssetBlurAdjustment *)self darkeningOverlayOpacity];
  v12 = v11;
  if (v13 > 0.0)
  {
    v14 = (void *)MEMORY[0x1E4FB1618];
    [(PXGDisplayAssetBlurAdjustment *)self darkeningOverlayOpacity];
    v26 = [v14 colorWithWhite:0.0 alpha:v15];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1E008]) initWithColor:v26];
    v17 = (void *)MEMORY[0x1E4F1E040];
    uint64_t v29 = *MEMORY[0x1E4F1E448];
    v30[0] = v16;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v19 = [v17 filterWithName:@"CIConstantColorGenerator" withInputParameters:v18];

    v20 = [v19 outputImage];
    v21 = (void *)MEMORY[0x1E4F1E040];
    v27[0] = *MEMORY[0x1E4F1E418];
    v27[1] = v8;
    v28[0] = v11;
    v28[1] = v20;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    v23 = [v21 filterWithName:@"CISourceOverCompositing" withInputParameters:v22];

    v12 = [v23 outputImage];
  }
  objc_msgSend(v5, "extent", v26);
  v24 = objc_msgSend(v12, "imageByCroppingToRect:");

  return v24;
}

- (PXGDisplayAssetBlurAdjustment)initWithBlurRadius:(double)a3 darkeningOverlayOpacity:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXGDisplayAssetBlurAdjustment;
  result = [(PXGDisplayAssetBlurAdjustment *)&v7 init];
  if (result)
  {
    result->_blurRadius = a3;
    result->_darkeningOverlayOpacity = a4;
  }
  return result;
}

@end