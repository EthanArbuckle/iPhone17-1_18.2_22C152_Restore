@interface SFDetailedRowCardSection(SearchUIHorizontallyScrollingSectionModel)
- (double)_superGroupSpacing;
- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets;
- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator;
@end

@implementation SFDetailedRowCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  v2 = [a1 thumbnail];
  [v2 size];
  double v3 = 1.0;
  if (v4 <= 150.0)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1F40E62C0;
    objc_msgSendSuper2(&v7, sel_searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier);
    double v3 = v5;
  }

  return v3;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator
{
  return 1;
}

- (double)_superGroupSpacing
{
  return 0.0;
}

- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets
{
  int v0 = [MEMORY[0x1E4FAE198] isMacOS];
  double result = 4.0;
  if (v0) {
    return 2.0;
  }
  return result;
}

@end