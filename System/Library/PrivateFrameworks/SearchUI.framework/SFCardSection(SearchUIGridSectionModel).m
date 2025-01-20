@interface SFCardSection(SearchUIGridSectionModel)
- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel;
- (double)searchUIGridSectionModel_interItemSpacing;
- (id)searchUIGridSectionModel_heightDimensionWithColumnCount:()SearchUIGridSectionModel;
- (uint64_t)searchUIGridSectionModel_useBackground;
- (uint64_t)searchUIGridSectionModel_useEstimatedHeight;
@end

@implementation SFCardSection(SearchUIGridSectionModel)

- (id)searchUIGridSectionModel_heightDimensionWithColumnCount:()SearchUIGridSectionModel
{
  if (objc_msgSend(a1, "searchUIGridSectionModel_useEstimatedHeight"))
  {
    v1 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (uint64_t)searchUIGridSectionModel_useBackground
{
  return 0;
}

- (uint64_t)searchUIGridSectionModel_useEstimatedHeight
{
  return 1;
}

- (double)searchUIGridSectionModel_interItemSpacing
{
  return 8.0;
}

- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel
{
  return *MEMORY[0x1E4FB12A8];
}

@end