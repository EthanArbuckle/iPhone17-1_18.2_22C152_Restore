@interface SFMiniCardSection(SearchUIHorizontallyScrollingSectionModel)
- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets;
- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator;
@end

@implementation SFMiniCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  return 1.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator
{
  return 1;
}

- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets
{
  int v0 = [MEMORY[0x1E4FAE198] isMacOS];
  double result = 12.0;
  if (v0) {
    return 6.0;
  }
  return result;
}

@end