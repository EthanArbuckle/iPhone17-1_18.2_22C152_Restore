@interface SFSplitCardSection(SearchUIHorizontallyScrollingSectionModel)
- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground;
@end

@implementation SFSplitCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  return 1.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground
{
  return 1;
}

@end