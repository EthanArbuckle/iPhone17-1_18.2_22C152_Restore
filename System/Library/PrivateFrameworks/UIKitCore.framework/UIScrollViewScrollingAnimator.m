@interface UIScrollViewScrollingAnimator
@end

@implementation UIScrollViewScrollingAnimator

void __57___UIScrollViewScrollingAnimator__scrollToContentOffset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __71___UIScrollViewScrollingAnimator__scrollWithScrollToExtentAnimationTo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setContentOffsetWithDecelerationAnimation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end