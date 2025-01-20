@interface RFSimpleItemVisualElementCardSection(SearchUILeadingTrailingSectionModel)
- (uint64_t)customizeSection:()SearchUILeadingTrailingSectionModel isLeading:;
@end

@implementation RFSimpleItemVisualElementCardSection(SearchUILeadingTrailingSectionModel)

- (uint64_t)customizeSection:()SearchUILeadingTrailingSectionModel isLeading:
{
  return objc_msgSend(MEMORY[0x1E4F9A108], "customizeSection:isLeading:");
}

@end