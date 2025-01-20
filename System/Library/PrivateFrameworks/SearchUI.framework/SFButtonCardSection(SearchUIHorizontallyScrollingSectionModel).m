@interface SFButtonCardSection(SearchUIHorizontallyScrollingSectionModel)
- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground;
- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimension;
@end

@implementation SFButtonCardSection(SearchUIHorizontallyScrollingSectionModel)

- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimension
{
  return [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground
{
  return 1;
}

@end