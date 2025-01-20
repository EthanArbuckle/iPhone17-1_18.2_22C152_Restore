@interface SFLinkPresentationCardSection(SearchUIGridSectionModel)
- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel;
- (uint64_t)searchUIGridSectionModel_heightDimensionWithColumnCount:()SearchUIGridSectionModel;
- (uint64_t)searchUIGridSectionModel_useBackground;
@end

@implementation SFLinkPresentationCardSection(SearchUIGridSectionModel)

- (uint64_t)searchUIGridSectionModel_heightDimensionWithColumnCount:()SearchUIGridSectionModel
{
  return [MEMORY[0x1E4FB1308] absoluteDimension:dbl_1E46B6A50[a3 > 1]];
}

- (uint64_t)searchUIGridSectionModel_useBackground
{
  return 1;
}

- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel
{
  return 0.0;
}

@end