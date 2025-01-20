@interface UICollectionView
@end

@implementation UICollectionView

BOOL __55__UICollectionView_IC__ic_selectionContainsFocusedItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 row];
  if (v4 == [*(id *)(a1 + 32) row])
  {
    uint64_t v5 = [v3 item];
    BOOL v6 = v5 == [*(id *)(a1 + 32) item];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end