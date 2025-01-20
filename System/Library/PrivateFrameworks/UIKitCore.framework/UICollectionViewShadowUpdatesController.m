@interface UICollectionViewShadowUpdatesController
@end

@implementation UICollectionViewShadowUpdatesController

void __91___UICollectionViewShadowUpdatesController__findShadowUpdateForIdentifier_inShadowUpdates___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v11 = v7;
  if (v7) {
    v8 = (void *)*((void *)v7 + 11);
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  int v10 = [v9 isEqual:*(void *)(a1 + 32)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __85___UICollectionViewShadowUpdatesController__findInsertShadowUpdateForFinalIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v12 = a2;
  if (![v12 updateAction])
  {
    id v7 = [*(id *)(a1 + 32) updateMap];
    v8 = -[UICollectionViewUpdateItem _indexPath](v12);
    if (v12) {
      id v9 = (void *)v12[11];
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    id v11 = [v7 finalIndexPathForIndexPath:v8 startingAtUpdateWithIdentifier:v10];

    if ([v11 isEqual:*(void *)(a1 + 40)])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

@end