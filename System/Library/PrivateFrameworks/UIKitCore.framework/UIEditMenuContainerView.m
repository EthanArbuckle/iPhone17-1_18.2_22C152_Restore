@interface UIEditMenuContainerView
@end

@implementation UIEditMenuContainerView

void __65___UIEditMenuContainerView__dismissMenuPresentationForSizeChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 424));
  [WeakRetained hideMenuWithReason:2];
}

@end