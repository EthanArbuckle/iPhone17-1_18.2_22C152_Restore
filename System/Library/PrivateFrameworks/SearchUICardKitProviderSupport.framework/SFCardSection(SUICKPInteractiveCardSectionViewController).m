@interface SFCardSection(SUICKPInteractiveCardSectionViewController)
- (uint64_t)_SUICKPInteractiveCardSectionViewController_shouldHandlePunchout;
- (uint64_t)_SUICKPInteractiveCardSectionViewController_shouldRenderButtonOverlay;
@end

@implementation SFCardSection(SUICKPInteractiveCardSectionViewController)

- (uint64_t)_SUICKPInteractiveCardSectionViewController_shouldRenderButtonOverlay
{
  return 0;
}

- (uint64_t)_SUICKPInteractiveCardSectionViewController_shouldHandlePunchout
{
  return 0;
}

@end