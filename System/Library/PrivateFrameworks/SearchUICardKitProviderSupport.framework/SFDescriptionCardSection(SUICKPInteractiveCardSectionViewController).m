@interface SFDescriptionCardSection(SUICKPInteractiveCardSectionViewController)
- (uint64_t)_SUICKPInteractiveCardSectionViewController_shouldRenderButtonOverlay;
@end

@implementation SFDescriptionCardSection(SUICKPInteractiveCardSectionViewController)

- (uint64_t)_SUICKPInteractiveCardSectionViewController_shouldRenderButtonOverlay
{
  return [a1 descriptionExpand] ^ 1;
}

@end