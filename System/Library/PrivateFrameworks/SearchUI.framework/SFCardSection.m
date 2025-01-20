@interface SFCardSection
@end

@implementation SFCardSection

uint64_t __116__SFCardSection_SearchUIHorizontallyScrollingSectionModel__searchUIHorizontallyScrollingSectionModel_idealItemWidth__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4FAE198] isMacOS];
  if (result)
  {
    double v1 = 113.0;
  }
  else
  {
    uint64_t result = [MEMORY[0x1E4FAE198] isLargePhone];
    double v1 = 155.0;
    if (result) {
      double v1 = 170.0;
    }
  }
  searchUIHorizontallyScrollingSectionModel_idealItemWidth_idealItemWidth = *(void *)&v1;
  return result;
}

@end