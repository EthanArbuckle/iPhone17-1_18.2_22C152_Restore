@interface UIKeyShortcutHUDCollectionViewManager
@end

@implementation UIKeyShortcutHUDCollectionViewManager

uint64_t __98___UIKeyShortcutHUDCollectionViewManager_client_flashCellIfPossibleAtIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFlashing:0];
  [*(id *)(a1 + 40) _collectionView:*(void *)(a1 + 48) updateSeparatorVisibilityForCellAtIndexPath:*(void *)(a1 + 56)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

@end