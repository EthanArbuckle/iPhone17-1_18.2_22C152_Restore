@interface UICollectionViewLayoutSwipeActionsModule
@end

@implementation UICollectionViewLayoutSwipeActionsModule

void __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  _UIPerformImmediateCollectionViewLayoutAndVisibleCellsUpdate(*(void **)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) indexPath];
  _UIUpdateMaskViewFrameForSwipedCellAtIndexPath(v2, v3);
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) unlockActionViewForAnimation:*(void *)(result + 40)];
  }
  return result;
}

void __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v2 = [*(id *)(a1 + 40) indexPath];
  _UIInvalidateSwipeActionsLayoutForDecorationViewAtIndexPath(WeakRetained, v2);
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke_2;
    v3[3] = &unk_1E52D9FC0;
    char v4 = *(unsigned char *)(result + 40);
    v3[4] = v1;
    result = +[UIView performWithoutAnimation:v3];
    *(unsigned char *)(*(void *)(v2 + 32) + 8) &= ~1u;
  }
  return result;
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v1) {
    return [v2 reconfigureActiveSwipeOccurrences];
  }
  else {
    return [v2 updateLayout];
  }
}

uint64_t __76___UICollectionViewLayoutSwipeActionsModule_updateWithDataSourceTranslator___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finalIndexPathForInitialIndexPath:a2];
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke(uint64_t a1)
{
  __asm { FMOV            V2.2D, #0.5 }
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", vaddq_f64(*(float64x2_t *)(a1 + 40), vmulq_f64(*(float64x2_t *)(a1 + 56), _Q2)));
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  double v10 = *(double *)(a1 + 96);
  v11 = *(void **)(a1 + 32);
  return objc_msgSend(v11, "setBounds:", v7, v8, v9, v10);
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke_49(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) resetAnimated:0 completion:0];
  }
  return result;
}

@end