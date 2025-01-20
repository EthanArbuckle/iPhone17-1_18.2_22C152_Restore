@interface UICollectionViewLayoutSwipeViewManipulator
@end

@implementation UICollectionViewLayoutSwipeViewManipulator

void __97___UICollectionViewLayoutSwipeViewManipulator_moveSwipedView_atIndexPath_withSwipeInfo_animator___block_invoke(uint64_t a1)
{
  _UIPerformImmediateCollectionViewLayoutAndVisibleCellsUpdate(*(void **)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  _UIUpdateMaskViewFrameForSwipedCellAtIndexPath(v2, v3);
}

@end