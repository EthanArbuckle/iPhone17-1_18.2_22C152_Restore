@interface UIButtonBarStackView
@end

@implementation UIButtonBarStackView

void __42___UIButtonBarStackView_updateConstraints__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 440));
  [WeakRetained _layoutBar];
}

@end