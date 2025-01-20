@interface CIImage(PIVideoReframe)
- (id)pi_imageByApplyingStabilizationWatermark;
@end

@implementation CIImage(PIVideoReframe)

- (id)pi_imageByApplyingStabilizationWatermark
{
  if (pi_imageByApplyingStabilizationWatermark_onceToken != -1) {
    dispatch_once(&pi_imageByApplyingStabilizationWatermark_onceToken, &__block_literal_global_24534);
  }
  [a1 extent];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  v10 = [MEMORY[0x1E4F1E050] imageWithCGImage:pi_imageByApplyingStabilizationWatermark_dotImage];
  v18.origin.x = v3;
  v18.origin.y = v5;
  v18.size.width = v7;
  v18.size.height = v9;
  CGFloat v11 = CGRectGetWidth(v18) * 0.5;
  v19.origin.x = v3;
  v19.origin.y = v5;
  v19.size.width = v7;
  v19.size.height = v9;
  CGFloat Height = CGRectGetHeight(v19);
  CGAffineTransformMakeTranslation(&v16, v11, Height * 0.5);
  v13 = [v10 imageByApplyingTransform:&v16];

  v14 = [v13 imageByCompositingOverImage:a1];

  return v14;
}

@end