@interface PXFrozenViewController
@end

@implementation PXFrozenViewController

uint64_t __44___PXFrozenViewController_unfreezeAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __44___PXFrozenViewController_unfreezeAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

@end