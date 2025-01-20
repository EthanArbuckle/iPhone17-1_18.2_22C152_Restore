@interface SFCardSection(SearchUILeadingTrailingSectionModel)
- (uint64_t)preferredBackgroundStyleForIsLeadingPrimaryCard:()SearchUILeadingTrailingSectionModel;
@end

@implementation SFCardSection(SearchUILeadingTrailingSectionModel)

- (uint64_t)preferredBackgroundStyleForIsLeadingPrimaryCard:()SearchUILeadingTrailingSectionModel
{
  return 5;
}

@end