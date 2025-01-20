@interface PUCollectionView
+ (id)_reuseKeyForSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (PUCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (PUCollectionViewReorderDelegate)reorderDelegate;
- (PUCollectionViewSelectionDelegate)selectionDelegate;
- (_UIDragSnappingFeedbackGenerator)_feedbackDragBehavior;
- (id)_reorderableLayout;
- (id)indexPathsForSelectedItems;
- (void)_applyAutomaticAdjustedContentOffset:(CGPoint)a3;
- (void)_handleDrag:(id)a3;
- (void)_updateDragUsingIndexPathUpdateBlock:(id)a3;
- (void)adjustedContentInsetDidChange;
- (void)dealloc;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)didScrollToInitialPosition;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)reloadData;
- (void)setReorderDelegate:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)visiblyInsertItemAtIndexPath:(id)a3 modelUpdate:(id)a4 completionHandler:(id)a5;
@end

@implementation PUCollectionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackDragBehavior, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_reorderDelegate);
  objc_storeStrong((id *)&self->_autoScroller, 0);
  objc_storeStrong((id *)&self->_draggedView, 0);
  objc_storeStrong((id *)&self->_dragTargetIndexPath, 0);
  objc_storeStrong((id *)&self->_dragSourceIndexPath, 0);
  objc_storeStrong((id *)&self->_dragGestureRecognizer, 0);
}

- (_UIDragSnappingFeedbackGenerator)_feedbackDragBehavior
{
  return self->__feedbackDragBehavior;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (PUCollectionViewSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  return (PUCollectionViewSelectionDelegate *)WeakRetained;
}

- (void)setReorderDelegate:(id)a3
{
}

- (PUCollectionViewReorderDelegate)reorderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reorderDelegate);
  return (PUCollectionViewReorderDelegate *)WeakRetained;
}

- (void)visiblyInsertItemAtIndexPath:(id)a3 modelUpdate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke;
  v17[3] = &unk_1E5F2EBC8;
  id v19 = v9;
  v17[4] = self;
  id v18 = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5F2AFC8;
  v14[4] = self;
  id v15 = v18;
  id v16 = v10;
  id v11 = v10;
  id v12 = v18;
  id v13 = v9;
  [(PUCollectionView *)self performBatchUpdates:v17 completion:v14];
}

void __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = (void *)a1[4];
  v5[0] = a1[5];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 insertItemsAtIndexPaths:v4];
}

void __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) indexPathsForVisibleItems];
  if (([v3 containsObject:*(void *)(a1 + 40)] & 1) == 0) {
    [*(id *)(a1 + 32) scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:0 animated:1];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_dragGestureRecognizer != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PUCollectionView;
    unsigned __int8 v5 = [(PUCollectionView *)&v13 gestureRecognizerShouldBegin:v4];
    goto LABEL_13;
  }
  v6 = [(PUCollectionView *)self collectionViewLayout];
  if (([v6 conformsToProtocol:&unk_1F083E528] & 1) == 0)
  {

    goto LABEL_9;
  }
  v7 = [(PUCollectionView *)self reorderDelegate];

  if (!v7)
  {
LABEL_9:
    unsigned __int8 v5 = 0;
    goto LABEL_13;
  }
  [(UILongPressGestureRecognizer *)v4 locationInView:self];
  id v8 = -[PUCollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  if (v8)
  {
    id v9 = [(PUCollectionView *)self reorderDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(PUCollectionView *)self reorderDelegate];
      unsigned __int8 v5 = [v11 collectionView:self canReorderItemAtIndexPath:v8];
    }
    else
    {
      unsigned __int8 v5 = 1;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

LABEL_13:
  return v5;
}

- (void)_updateDragUsingIndexPathUpdateBlock:(id)a3
{
  p_dragSourceIndexPath = &self->_dragSourceIndexPath;
  if (self->_dragSourceIndexPath)
  {
    unsigned __int8 v5 = (void (**)(id, void))a3;
    id v13 = [(PUCollectionView *)self _reorderableLayout];
    v6 = ((void (**)(id, NSIndexPath *))v5)[2](v5, *p_dragSourceIndexPath);
    p_dragTargetIndexPath = &self->_dragTargetIndexPath;
    id v8 = ((void (**)(id, NSIndexPath *))v5)[2](v5, self->_dragTargetIndexPath);

    if ([v6 item] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(UILongPressGestureRecognizer *)self->_dragGestureRecognizer pu_cancel];
    }
    else
    {
      if (([v6 isEqual:*p_dragSourceIndexPath] & 1) == 0)
      {
        [v13 endReordering];
        objc_storeStrong((id *)p_dragSourceIndexPath, v6);
        [v13 beginReorderingItemAtIndexPath:*p_dragSourceIndexPath];
      }
      if ([v6 item] != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_storeStrong((id *)&self->_dragTargetIndexPath, v8);
        [v13 updateReorderingTargetIndexPath:*p_dragTargetIndexPath];
      }
      id v9 = [(PUCollectionView *)self reorderDelegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = [(PUCollectionView *)self reorderDelegate];
        uint64_t v12 = [v11 collectionView:self targetIndexPathForMoveFromIndexPath:*p_dragSourceIndexPath toProposedIndexPath:*p_dragTargetIndexPath];

        id v8 = (void *)v12;
      }
      if (v8 && ([v8 isEqual:*p_dragTargetIndexPath] & 1) == 0)
      {
        objc_storeStrong((id *)p_dragTargetIndexPath, v8);
        [v13 updateReorderingTargetIndexPath:*p_dragTargetIndexPath];
      }
    }
  }
}

- (id)_reorderableLayout
{
  uint64_t v2 = [(PUCollectionView *)self collectionViewLayout];
  if (([v2 conformsToProtocol:&unk_1F083E528] & 1) == 0)
  {

    uint64_t v2 = 0;
  }
  return v2;
}

- (void)_handleDrag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  [v4 locationInView:self];
  v6 = -[PUCollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  v7 = [(PUCollectionView *)self _reorderableLayout];
  id v8 = [(PUCollectionView *)self superview];
  [v4 locationInView:v8];
  double v10 = v9;
  double v12 = v11;
  switch(v5)
  {
    case 1:
      id v13 = [(PUCollectionView *)self cellForItemAtIndexPath:v6];
      v14 = [v13 snapshotViewAfterScreenUpdates:1];
      [(UIView *)self->_draggedView removeFromSuperview];
      draggedView = self->_draggedView;
      self->_draggedView = v14;
      id v16 = v14;

      [v8 addSubview:self->_draggedView];
      v17 = self->_draggedView;
      [v13 frame];
      objc_msgSend(v8, "convertRect:fromView:", self);
      -[UIView setFrame:](v17, "setFrame:");
      [(UIView *)self->_draggedView center];
      self->_draggedViewCenterOffset.x = v10 - v18;
      [(UIView *)self->_draggedView center];
      self->_draggedViewCenterOffset.y = v12 - v19;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __32__PUCollectionView__handleDrag___block_invoke;
      v49[3] = &unk_1E5F2ED10;
      v49[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v49 animations:0.3];
      [v7 beginReorderingItemAtIndexPath:v6];
      objc_storeStrong((id *)&self->_dragTargetIndexPath, v6);
      objc_storeStrong((id *)&self->_dragSourceIndexPath, v6);
      v20 = (PXUIAutoScroller *)[objc_alloc(MEMORY[0x1E4F90848]) initWithTargetScrollView:self];
      autoScroller = self->_autoScroller;
      self->_autoScroller = v20;

      v22 = [(PUCollectionView *)self _feedbackDragBehavior];
      [v22 userInteractionStarted];

      v23 = [(PUCollectionView *)self _feedbackDragBehavior];
      [v23 draggedObjectLifted];

      break;
    case 2:
      if (v6)
      {
        v24 = [v7 reorderedIndexPath:v6];

        if (v24)
        {
          v25 = [(PUCollectionView *)self reorderDelegate];
          char v26 = objc_opt_respondsToSelector();

          if ((v26 & 1) == 0
            || ([(PUCollectionView *)self reorderDelegate],
                v27 = objc_claimAutoreleasedReturnValue(),
                [v27 collectionView:self targetIndexPathForMoveFromIndexPath:self->_dragSourceIndexPath toProposedIndexPath:v24], uint64_t v28 = objc_claimAutoreleasedReturnValue(), v24, v27, (v24 = (void *)v28) != 0))
          {
            char v29 = [v24 isEqual:self->_dragTargetIndexPath];
            objc_storeStrong((id *)&self->_dragTargetIndexPath, v24);
            [v7 updateReorderingTargetIndexPath:self->_dragTargetIndexPath];
            if ((v29 & 1) == 0)
            {
              v30 = [(PUCollectionView *)self _feedbackDragBehavior];
              [v30 dropTargetUpdated];
            }
          }
        }
      }
      else
      {
        v24 = 0;
      }
      -[UIView setCenter:](self->_draggedView, "setCenter:", v10 - self->_draggedViewCenterOffset.x, v12 - self->_draggedViewCenterOffset.y);
      [(PXUIAutoScroller *)self->_autoScroller updateWithGestureRecognizer:v4];
      v6 = v24;
      break;
    case 3:
      v31 = (void *)MEMORY[0x1E4FB1EB0];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __32__PUCollectionView__handleDrag___block_invoke_2;
      v45[3] = &unk_1E5F2E908;
      id v46 = v7;
      v47 = self;
      id v48 = v8;
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __32__PUCollectionView__handleDrag___block_invoke_3;
      v42 = &unk_1E5F2E1C0;
      v43 = self;
      id v44 = v46;
      [v31 animateWithDuration:v45 animations:&v39 completion:0.3];
      [(PXUIAutoScroller *)self->_autoScroller stop];
      v32 = self->_autoScroller;
      self->_autoScroller = 0;

      v33 = [(PUCollectionView *)self _feedbackDragBehavior];
      [v33 userInteractionEnded];

      break;
    case 4:
      [v7 endReordering];
      [(PUCollectionView *)self reloadData];
      [(UIView *)self->_draggedView removeFromSuperview];
      v34 = self->_draggedView;
      self->_draggedView = 0;

      dragTargetIndexPath = self->_dragTargetIndexPath;
      self->_dragTargetIndexPath = 0;

      dragSourceIndexPath = self->_dragSourceIndexPath;
      self->_dragSourceIndexPath = 0;

      [(PXUIAutoScroller *)self->_autoScroller stop];
      v37 = self->_autoScroller;
      self->_autoScroller = 0;

      v38 = [(PUCollectionView *)self _feedbackDragBehavior];
      [v38 userInteractionCancelled];

      break;
    default:
      break;
  }
}

uint64_t __32__PUCollectionView__handleDrag___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 3296);
  CGAffineTransformMakeScale(&v3, 1.20000005, 1.20000005);
  return [v1 setTransform:&v3];
}

void __32__PUCollectionView__handleDrag___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) layoutAttributesForItemAtIndexPath:*(void *)(*(void *)(a1 + 40) + 3280)];
  [v2 center];
  objc_msgSend(*(id *)(a1 + 48), "convertPoint:fromView:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 3296), "setCenter:");
  CGAffineTransform v3 = *(void **)(*(void *)(a1 + 40) + 3296);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  void v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v5];
}

void __32__PUCollectionView__handleDrag___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) reorderDelegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 3280);
  uint64_t v5 = *(void *)(v3 + 3288);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__PUCollectionView__handleDrag___block_invoke_4;
  v8[3] = &unk_1E5F2ECC8;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  [v2 collectionView:v3 moveItemAtIndexPath:v4 toIndexPath:v5 completionHandler:v8];
}

void __32__PUCollectionView__handleDrag___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) endReordering];
  [*(id *)(a1 + 40) reloadData];
  [*(id *)(*(void *)(a1 + 40) + 3296) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 3296);
  *(void *)(v2 + 3296) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 3288);
  *(void *)(v4 + 3288) = 0;

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 3280);
  *(void *)(v6 + 3280) = 0;

  id v8 = [*(id *)(a1 + 40) _feedbackDragBehavior];
  [v8 draggedObjectLanded];
}

- (void)_applyAutomaticAdjustedContentOffset:(CGPoint)a3
{
  if (!self->_shouldWorkaround34630932)
  {
    v3.receiver = self;
    v3.super_class = (Class)PUCollectionView;
    -[PUCollectionView _applyAutomaticAdjustedContentOffset:](&v3, sel__applyAutomaticAdjustedContentOffset_, a3.x, a3.y);
  }
}

- (void)didScrollToInitialPosition
{
  self->_shouldWorkaround34630932 = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PUCollectionView_didScrollToInitialPosition__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__PUCollectionView_didScrollToInitialPosition__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 3328) = 0;
  return result;
}

- (id)indexPathsForSelectedItems
{
  objc_super v3 = [(PUCollectionView *)self selectionDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 indexPathsForSelectedItemsInCollectionView:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUCollectionView;
    uint64_t v4 = [(PUCollectionView *)&v7 indexPathsForSelectedItems];
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)PUCollectionView;
  [(PUCollectionView *)&v3 reloadData];
  [(UILongPressGestureRecognizer *)self->_dragGestureRecognizer pu_cancel];
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUCollectionView;
  [(PUCollectionView *)&v13 moveItemAtIndexPath:v6 toIndexPath:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PUCollectionView_moveItemAtIndexPath_toIndexPath___block_invoke;
  v10[3] = &unk_1E5F24558;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PUCollectionView *)self _updateDragUsingIndexPathUpdateBlock:v10];
}

uint64_t __52__PUCollectionView_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_alteredIndexPathAfterMovingItemAtIndexPath:toIndexPath:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUCollectionView;
  [(PUCollectionView *)&v8 deleteItemsAtIndexPaths:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PUCollectionView_deleteItemsAtIndexPaths___block_invoke;
  v6[3] = &unk_1E5F24530;
  id v7 = v4;
  id v5 = v4;
  [(PUCollectionView *)self _updateDragUsingIndexPathUpdateBlock:v6];
}

uint64_t __44__PUCollectionView_deleteItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_alteredIndexPathAfterDeletingItemsAtIndexPaths:", *(void *)(a1 + 32));
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUCollectionView;
  [(PUCollectionView *)&v8 insertItemsAtIndexPaths:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PUCollectionView_insertItemsAtIndexPaths___block_invoke;
  v6[3] = &unk_1E5F24530;
  id v7 = v4;
  id v5 = v4;
  [(PUCollectionView *)self _updateDragUsingIndexPathUpdateBlock:v6];
}

uint64_t __44__PUCollectionView_insertItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_alteredIndexPathAfterInsertingItemsAtIndexPaths:", *(void *)(a1 + 32));
}

- (void)adjustedContentInsetDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUCollectionView;
  [(PUCollectionView *)&v4 adjustedContentInsetDidChange];
  objc_super v3 = [(PUCollectionView *)self collectionViewLayout];
  if (objc_opt_respondsToSelector()) {
    [v3 invalidateLayoutForVerticalScroll];
  }
}

- (void)dealloc
{
  [(UILongPressGestureRecognizer *)self->_dragGestureRecognizer setDelegate:0];
  [(PUCollectionView *)self removeGestureRecognizer:self->_dragGestureRecognizer];
  v3.receiver = self;
  v3.super_class = (Class)PUCollectionView;
  [(PUCollectionView *)&v3 dealloc];
}

- (PUCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PUCollectionView;
  objc_super v4 = -[PUCollectionView initWithFrame:collectionViewLayout:](&v20, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v4 action:sel__handleDrag_];
    dragGestureRecognizer = v4->_dragGestureRecognizer;
    v4->_dragGestureRecognizer = (UILongPressGestureRecognizer *)v5;

    [(UILongPressGestureRecognizer *)v4->_dragGestureRecognizer setMinimumPressDuration:0.2];
    [(UILongPressGestureRecognizer *)v4->_dragGestureRecognizer setDelegate:v4];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB20C0]) initWithCoordinateSpace:v4];
    feedbackDragBehavior = v4->__feedbackDragBehavior;
    v4->__feedbackDragBehavior = (_UIDragSnappingFeedbackGenerator *)v7;

    id v9 = [(PUCollectionView *)v4 gestureRecognizers];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 requireGestureRecognizerToFail:v4->_dragGestureRecognizer];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }
    [(PUCollectionView *)v4 addGestureRecognizer:v4->_dragGestureRecognizer];
  }
  return v4;
}

+ (id)_reuseKeyForSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    id v9 = v5;
  }
  else
  {
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __76__PUCollectionView__reuseKeyForSupplementaryViewOfKind_withReuseIdentifier___block_invoke;
    v14 = &unk_1E5F2ECC8;
    id v7 = v5;
    id v15 = v7;
    id v8 = v6;
    id v16 = v8;
    if (_reuseKeyForSupplementaryViewOfKind_withReuseIdentifier__onceToken != -1) {
      dispatch_once(&_reuseKeyForSupplementaryViewOfKind_withReuseIdentifier__onceToken, &block);
    }
    id v9 = [NSString stringWithFormat:@"%@/%@", v7, v8, block, v12, v13, v14];
  }
  return v9;
}

void __76__PUCollectionView__reuseKeyForSupplementaryViewOfKind_withReuseIdentifier___block_invoke(uint64_t a1)
{
}

@end