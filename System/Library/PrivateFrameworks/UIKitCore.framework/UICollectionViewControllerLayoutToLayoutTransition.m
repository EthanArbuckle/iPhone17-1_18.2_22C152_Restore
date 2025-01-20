@interface UICollectionViewControllerLayoutToLayoutTransition
@end

@implementation UICollectionViewControllerLayoutToLayoutTransition

uint64_t __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transitionWasCancelled] ^ 1;
  [*(id *)(a1 + 32) completeTransition:v2];
  return v2;
}

void __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke_2(id *a1)
{
  id v3 = [a1[4] collectionView];
  uint64_t v2 = [a1[5] toLayout];
  objc_msgSend(v3, "_setCollectionViewLayout:animated:isInteractive:completion:", v2, objc_msgSend(a1[6], "isAnimated"), objc_msgSend(a1[6], "isInteractive"), 0);
}

@end