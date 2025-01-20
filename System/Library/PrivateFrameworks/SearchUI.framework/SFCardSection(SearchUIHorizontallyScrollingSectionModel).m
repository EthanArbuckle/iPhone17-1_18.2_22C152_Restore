@interface SFCardSection(SearchUIHorizontallyScrollingSectionModel)
+ (double)searchUIHorizontallyScrollingSectionModel_idealItemWidth;
- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets;
- (double)searchUIHorizontallyScrollingSectionModel_customSectionInsets;
- (double)searchUIHorizontallyScrollingSectionModel_interItemSpacing;
- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_heightDimension;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimension;
@end

@implementation SFCardSection(SearchUIHorizontallyScrollingSectionModel)

+ (double)searchUIHorizontallyScrollingSectionModel_idealItemWidth
{
  if (searchUIHorizontallyScrollingSectionModel_idealItemWidth_onceToken != -1) {
    dispatch_once(&searchUIHorizontallyScrollingSectionModel_idealItemWidth_onceToken, &__block_literal_global_47);
  }
  return *(double *)&searchUIHorizontallyScrollingSectionModel_idealItemWidth_idealItemWidth;
}

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  return 2.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimension
{
  objc_msgSend((id)objc_opt_class(), "searchUIHorizontallyScrollingSectionModel_idealItemWidth");
  double v3 = v2;
  objc_msgSend(a1, "searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier");
  double v5 = v4;
  double v6 = 1.0;
  if (v5 < 2.0)
  {
    int v7 = objc_msgSend(MEMORY[0x1E4FAE100], "isSuperLargeAccessibilitySize", 1.0);
    double v6 = 1.0;
    if (v7) {
      double v6 = 2.0;
    }
  }
  double v8 = v5 * v6;
  objc_msgSend(a1, "searchUIHorizontallyScrollingSectionModel_interItemSpacing");
  [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:0 forView:v9 * (v8 + -1.0) + v3 * v8];
  v10 = (void *)MEMORY[0x1E4FB1308];
  return objc_msgSend(v10, "absoluteDimension:");
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_heightDimension
{
  return [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground
{
  return 0;
}

- (double)searchUIHorizontallyScrollingSectionModel_interItemSpacing
{
  return 8.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator
{
  return 0;
}

- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets
{
  return *MEMORY[0x1E4FB12A8];
}

- (double)searchUIHorizontallyScrollingSectionModel_customSectionInsets
{
  return *MEMORY[0x1E4FB12A8];
}

@end