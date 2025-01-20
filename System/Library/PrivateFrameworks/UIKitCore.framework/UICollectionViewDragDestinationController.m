@interface UICollectionViewDragDestinationController
@end

@implementation UICollectionViewDragDestinationController

void __95___UICollectionViewDragDestinationController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = WeakRetained;
  -[_UICollectionViewDragAndDropController dragDestinationController:didCompleteDropAnimationForDragItem:](WeakRetained);
}

uint64_t __81___UICollectionViewDragDestinationController__commitCurrentInteractiveReordering__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finalIndexPathForInitialIndexPath:a2];
}

void __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = v5;
  if (!v5 || (id v6 = v5, (*((_WORD *)v5 + 144) & 1) == 0))
  {
    [*(id *)(a1 + 32) addIndex:a3];
    id v6 = v7;
  }
  if ([*(id *)(a1 + 40) isEqual:v6]) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

uint64_t __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 center];
  double v8 = sqrt((v6 - *(double *)(a1 + 32)) * (v6 - *(double *)(a1 + 32))+ (v7 - *(double *)(a1 + 40)) * (v7 - *(double *)(a1 + 40)));
  [v5 center];
  double v10 = v9;
  double v12 = v11;

  double v13 = sqrt((v10 - *(double *)(a1 + 32)) * (v10 - *(double *)(a1 + 32))+ (v12 - *(double *)(a1 + 40)) * (v12 - *(double *)(a1 + 40)));
  if (v8 >= v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = -1;
  }
  if (v8 > v13) {
    return 1;
  }
  else {
    return v14;
  }
}

@end