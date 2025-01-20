@interface SFLinkPresentationCardSection(SearchUIHorizontallyScrollingSectionModel)
- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_heightDimension;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground;
@end

@implementation SFLinkPresentationCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  int v0 = [MEMORY[0x1E4FAE198] isMacOS];
  double result = 1.33333333;
  if (!v0) {
    return 1.0;
  }
  return result;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_heightDimension
{
  return [MEMORY[0x1E4FB1308] absoluteDimension:128.0];
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground
{
  return 1;
}

@end