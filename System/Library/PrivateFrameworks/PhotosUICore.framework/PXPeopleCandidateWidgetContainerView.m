@interface PXPeopleCandidateWidgetContainerView
@end

@implementation PXPeopleCandidateWidgetContainerView

uint64_t __55___PXPeopleCandidateWidgetContainerView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrame:");
  v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v2 layoutIfNeeded];
}

@end