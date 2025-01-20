@interface UICollectionView
@end

@implementation UICollectionView

uint64_t __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end