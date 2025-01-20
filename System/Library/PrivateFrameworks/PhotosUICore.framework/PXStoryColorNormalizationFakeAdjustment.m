@interface PXStoryColorNormalizationFakeAdjustment
+ (PFStoryRecipeDisplayAssetNormalization)fakeNormalization;
- (PXStoryColorNormalizationFakeAdjustment)init;
- (id)adjustmentSummary;
@end

@implementation PXStoryColorNormalizationFakeAdjustment

- (id)adjustmentSummary
{
  return @"simulated";
}

- (PXStoryColorNormalizationFakeAdjustment)init
{
  v3 = +[PXStoryColorNormalizationFakeAdjustment fakeNormalization];
  v6.receiver = self;
  v6.super_class = (Class)PXStoryColorNormalizationFakeAdjustment;
  v4 = [(PXStoryColorNormalizationAdjustment *)&v6 initWithNormalization:v3];

  return v4;
}

+ (PFStoryRecipeDisplayAssetNormalization)fakeNormalization
{
  if (fakeNormalization_s_generateFakeNormalizationOnce != -1) {
    dispatch_once(&fakeNormalization_s_generateFakeNormalizationOnce, &__block_literal_global_50324);
  }
  v2 = (void *)fakeNormalization_s_fakeNormalization;
  return (PFStoryRecipeDisplayAssetNormalization *)v2;
}

void __60__PXStoryColorNormalizationFakeAdjustment_fakeNormalization__block_invoke()
{
  PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F8CDC8]) initWithAnalysisData:v2];
  v1 = (void *)fakeNormalization_s_fakeNormalization;
  fakeNormalization_s_fakeNormalization = v0;
}

@end