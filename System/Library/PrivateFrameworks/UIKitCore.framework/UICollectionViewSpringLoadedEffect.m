@interface UICollectionViewSpringLoadedEffect
@end

@implementation UICollectionViewSpringLoadedEffect

void __72___UICollectionViewSpringLoadedEffect_interaction_didChangeWithContext___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isHighlighted];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (v2) {
    [WeakRetained _unhighlightSpringLoadedItem];
  }
  else {
    [WeakRetained _highlightSpringLoadedItemAtIndexPath:*(void *)(a1 + 40)];
  }
}

@end