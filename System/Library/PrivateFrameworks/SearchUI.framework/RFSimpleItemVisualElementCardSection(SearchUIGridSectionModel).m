@interface RFSimpleItemVisualElementCardSection(SearchUIGridSectionModel)
- (double)searchUIGridSectionModel_customSectionInsets;
- (double)searchUIGridSectionModel_interItemSpacing;
- (uint64_t)searchUIGridSectionModel_useEstimatedHeight;
@end

@implementation RFSimpleItemVisualElementCardSection(SearchUIGridSectionModel)

- (uint64_t)searchUIGridSectionModel_useEstimatedHeight
{
  if ([MEMORY[0x1E4FAE198] isPhone]) {
    return [MEMORY[0x1E4FAE198] isIpad] ^ 1;
  }
  else {
    return 1;
  }
}

- (double)searchUIGridSectionModel_interItemSpacing
{
  return 3.0;
}

- (double)searchUIGridSectionModel_customSectionInsets
{
  return 0.0;
}

@end