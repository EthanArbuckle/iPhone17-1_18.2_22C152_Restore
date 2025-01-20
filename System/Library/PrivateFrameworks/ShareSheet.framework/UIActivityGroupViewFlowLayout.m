@interface UIActivityGroupViewFlowLayout
@end

@implementation UIActivityGroupViewFlowLayout

void __68___UIActivityGroupViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 frame];
  if (CGRectIntersectsRect(v6, *(CGRect *)(a1 + 48)))
  {
    id v3 = (id)[*(id *)(a1 + 32) adjustLayoutAttributesForDraggingIfNeeded:v4];
    [*(id *)(a1 + 40) addObject:v4];
  }
}

uint64_t __81___UIActivityGroupViewFlowLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) collectionView:*(void *)(a1 + 40) layout:*(void *)(a1 + 48) preferredSizeForItemAtIndexPath:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(double *)(v6 + 40) >= v5) {
    double v5 = *(double *)(v6 + 40);
  }
  *(double *)(v6 + 40) = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(double *)(v7 + 32) >= v4) {
    double v4 = *(double *)(v7 + 32);
  }
  *(double *)(v7 + 32) = v4;
  return result;
}

uint64_t __55___UIActivityGroupViewFlowLayout_handleEditingGesture___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) collectionView];
  [v2 moveItemAtIndexPath:*(void *)(a1 + 40) toIndexPath:*(void *)(a1 + 48)];

  uint64_t v3 = *(void *)(a1 + 48);
  double v4 = *(void **)(a1 + 32);
  return [v4 setIndexPathForDraggedItem:v3];
}

uint64_t __68___UIActivityGroupViewFlowLayout_invalidateGroupViewLayoutAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateLayout];
}

uint64_t __58___UIActivityGroupViewFlowLayout_beginDraggingForGesture___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.25, 1.25);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  [*(id *)(a1 + 32) setAlpha:0.75];
  return [*(id *)(a1 + 32) setHighlighted:0];
}

void __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v3;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v9];
  CGAffineTransform v4 = *(void **)(a1 + 40);
  CGAffineTransform v5 = [v4 indexPathForDraggedItem];
  uint64_t v6 = [v4 layoutAttributesForItemAtIndexPath:v5];

  uint64_t v7 = [*(id *)(a1 + 32) superview];
  v8 = [*(id *)(a1 + 40) collectionView];
  [v6 center];
  objc_msgSend(v8, "convertPoint:toView:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");

  [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIndexPathForDraggedItem:0];
  [*(id *)(a1 + 32) invalidateGroupViewLayoutAnimated:1];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

@end