@interface TVCollectionView
@end

@implementation TVCollectionView

void __50___TVCollectionView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  LOBYTE(v3) = [v5 collectionView:*(void *)(a1 + 32) shouldHandleLongPressForItemAtIndexPath:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __39___TVCollectionView__playButtonAction___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 collectionView:*(void *)(a1 + 32) didReceivePhysicalPlayForItemAtIndexPath:v4];
}

void __38___TVCollectionView__longPressAction___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 collectionView:*(void *)(a1 + 32) didReceiveLongPressForItemAtIndexPath:v4];
}

id __37___TVCollectionView_setContentInset___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_TVCollectionView;
  return objc_msgSendSuper2(&v2, sel_setContentInset_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end