@interface UIPageIndicatorView
@end

@implementation UIPageIndicatorView

void __31___UIPageIndicatorView_prepare__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIndicatorExpandProgress];
  [WeakRetained setNeedsLayout];
}

@end