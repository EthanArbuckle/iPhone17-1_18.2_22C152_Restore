@interface PXStoryColorNormalizationAdjustment
+ (id)_falseColorMatrixParameters;
+ (id)autoAdjustmentForAsset:(id)a3;
+ (id)colorCubeForNormalization:(id)a3 targetColorSpace:(CGColorSpace *)a4;
+ (id)dummyAdjustment;
+ (id)dummyNormalization;
- (BOOL)allowsUnadjustedOpportunisticDelivery;
- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3;
- (BOOL)useColorCube;
- (BOOL)useFalseColor;
- (BOOL)wantsSingleHighQualityDelivery;
- (NSString)adjustmentDetails;
- (NSString)adjustmentSummary;
- (PFStoryRecipeDisplayAssetNormalization)normalization;
- (PIColorNormalizationFilter)filter;
- (PXStoryColorNormalizationAdjustment)initWithNormalization:(id)a3;
- (PXStoryColorNormalizationAdjustment)initWithNormalizationFilter:(id)a3;
- (double)intensity;
- (id)applyToImage:(id)a3 targetSize:(CGSize)a4;
- (int64_t)contentModeForProposedContentMode:(int64_t)a3;
- (unint64_t)hash;
- (void)setIntensity:(double)a3;
- (void)setUseColorCube:(BOOL)a3;
- (void)setUseFalseColor:(BOOL)a3;
@end

@implementation PXStoryColorNormalizationAdjustment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_colorCubeData, 0);
}

- (PIColorNormalizationFilter)filter
{
  return self->_filter;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setUseColorCube:(BOOL)a3
{
  self->_useColorCube = a3;
}

- (BOOL)useColorCube
{
  return self->_useColorCube;
}

- (void)setUseFalseColor:(BOOL)a3
{
  self->_useFalseColor = a3;
}

- (BOOL)useFalseColor
{
  return self->_useFalseColor;
}

- (NSString)adjustmentDetails
{
  v2 = [(PXStoryColorNormalizationAdjustment *)self normalization];
  v3 = [v2 detailedDescription];

  return (NSString *)v3;
}

- (NSString)adjustmentSummary
{
  return (NSString *)@"precomputed";
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 1;
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(PXStoryColorNormalizationAdjustment *)self useColorCube])
  {
    v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    colorCubeData = self->_colorCubeData;
    if (!colorCubeData)
    {
      v8 = [(PIColorNormalizationFilter *)self->_filter inputNormalization];
      v9 = +[PXStoryColorNormalizationAdjustment colorCubeForNormalization:v8 targetColorSpace:v6];
      v10 = self->_colorCubeData;
      self->_colorCubeData = v9;

      colorCubeData = self->_colorCubeData;
    }
    v29[0] = @"inputCubeData";
    v29[1] = @"inputColorSpace";
    v30[0] = colorCubeData;
    v30[1] = v6;
    v29[2] = @"inputCubeDimension";
    v30[2] = &unk_1F02D6760;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
    v12 = [v5 imageByApplyingFilter:@"CIColorCubeWithColorSpace" withInputParameters:v11];

    CGColorSpaceRelease(v6);
  }
  else
  {
    [(PIColorNormalizationFilter *)self->_filter setInputImage:v5];
    v12 = [(PIColorNormalizationFilter *)self->_filter outputImage];
    [(PIColorNormalizationFilter *)self->_filter setInputImage:0];
  }
  if ([(PXStoryColorNormalizationAdjustment *)self useFalseColor])
  {
    v27[0] = @"inputRVector";
    v13 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
    v28[0] = v13;
    v27[1] = @"inputGVector";
    v14 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:1.0 W:0.0];
    v28[1] = v14;
    v27[2] = @"inputBVector";
    v15 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
    v28[2] = v15;
    v27[3] = @"inputBiasVector";
    v16 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    v28[3] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
    uint64_t v18 = [v12 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v17];

    v12 = (void *)v18;
  }
  [(PXStoryColorNormalizationAdjustment *)self intensity];
  if (v19 < 1.0)
  {
    v20 = NSNumber;
    [(PXStoryColorNormalizationAdjustment *)self intensity];
    v21 = objc_msgSend(v20, "numberWithDouble:");
    v26[1] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:2];
    uint64_t v23 = [v5 imageByApplyingFilter:@"CIDissolveTransition" withInputParameters:v22];

    v12 = (void *)v23;
  }

  return v12;
}

- (PFStoryRecipeDisplayAssetNormalization)normalization
{
  return (PFStoryRecipeDisplayAssetNormalization *)[(PIColorNormalizationFilter *)self->_filter inputNormalization];
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 0;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 1;
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  v4 = (PXStoryColorNormalizationAdjustment *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(PXStoryColorNormalizationAdjustment *)self filter];
      v7 = [(PXStoryColorNormalizationAdjustment *)v5 filter];
      if (v6 == v7) {
        char v8 = 1;
      }
      else {
        char v8 = [v6 isEqual:v7];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(PXStoryColorNormalizationAdjustment *)self filter];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PXStoryColorNormalizationAdjustment)initWithNormalizationFilter:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXStoryColorNormalizationAdjustment.m", 84, @"Invalid parameter not satisfying: %@", @"filter != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PXStoryColorNormalizationAdjustment;
  v7 = [(PXStoryColorNormalizationAdjustment *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_filter, a3);
    v9 = +[PXStorySettings sharedInstance];
    v8->_useFalseColor = [v9 enableFalseColorNormalization];

    v8->_intensity = 1.0;
  }

  return v8;
}

- (PXStoryColorNormalizationAdjustment)initWithNormalization:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXStoryColorNormalizationAdjustment.m", 73, @"Invalid parameter not satisfying: %@", @"normalization != nil" object file lineNumber description];
  }
  id v6 = objc_alloc_init((Class)getPIColorNormalizationFilterClass());
  [v6 setInputNormalization:v5];
  v7 = [(PXStoryColorNormalizationAdjustment *)self initWithNormalizationFilter:v6];

  return v7;
}

+ (id)colorCubeForNormalization:(id)a3 targetColorSpace:(CGColorSpace *)a4
{
  id v5 = a3;
  id v6 = [getPIColorNormalizationFilterClass() colorCubeForNormalization:v5 dimension:32 targetColorSpace:a4];

  return v6;
}

+ (id)_falseColorMatrixParameters
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"inputRVector";
  v2 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v9[0] = v2;
  v8[1] = @"inputGVector";
  unint64_t v3 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:1.0 W:0.0];
  v9[1] = v3;
  v8[2] = @"inputBVector";
  v4 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
  v9[2] = v4;
  v8[3] = @"inputBiasVector";
  id v5 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)autoAdjustmentForAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getPIColorNormalizationFilterClass());
  id v5 = [(PXStoryColorNormalizationAdjustment *)[PXStoryColorNormalizationAutoAdjustment alloc] initWithNormalizationFilter:v4];
  [(PXStoryColorNormalizationAutoAdjustment *)v5 setAsset:v3];

  return v5;
}

+ (id)dummyNormalization
{
  return +[PXStoryColorNormalizationFakeAdjustment fakeNormalization];
}

+ (id)dummyAdjustment
{
  v2 = objc_alloc_init(PXStoryColorNormalizationFakeAdjustment);
  return v2;
}

@end