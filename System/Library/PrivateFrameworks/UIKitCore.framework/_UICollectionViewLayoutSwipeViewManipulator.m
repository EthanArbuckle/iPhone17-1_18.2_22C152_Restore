@interface _UICollectionViewLayoutSwipeViewManipulator
- (CGRect)restingFrameForSwipedView:(id)a3 atIndexPath:(id)a4;
- (_UICollectionViewLayoutSwipeViewManipulator)initWithCollectionView:(id)a3 swipeActionsModule:(id)a4;
- (void)moveSwipedView:(id)a3 atIndexPath:(id)a4 withSwipeInfo:(id *)a5 animator:(id)a6;
@end

@implementation _UICollectionViewLayoutSwipeViewManipulator

- (_UICollectionViewLayoutSwipeViewManipulator)initWithCollectionView:(id)a3 swipeActionsModule:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewLayoutSwipeViewManipulator;
  v8 = [(_UICollectionViewLayoutSwipeViewManipulator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    objc_storeWeak((id *)&v9->_swipeActionsModule, v7);
  }

  return v9;
}

- (void)moveSwipedView:(id)a3 atIndexPath:(id)a4 withSwipeInfo:(id *)a5 animator:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (v9)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_swipeActionsModule);
    [v11 _performForcedCollectionViewLayoutPreservingExistingLayoutAttributes];
  }
  v12 = [WeakRetained collectionViewLayout];
  _UIInvalidateSwipeActionsLayoutForItemAtIndexPath(v12, v8);

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __97___UICollectionViewLayoutSwipeViewManipulator_moveSwipedView_atIndexPath_withSwipeInfo_animator___block_invoke;
  v20 = &unk_1E52D9F98;
  id v21 = WeakRetained;
  id v22 = v8;
  id v13 = v8;
  id v14 = WeakRetained;
  v15 = _Block_copy(&v17);
  v16 = v15;
  if (v9) {
    objc_msgSend(v9, "addAnimations:", v15, v17, v18, v19, v20, v21, v22);
  }
  else {
    (*((void (**)(void *))v15 + 2))(v15);
  }
}

- (CGRect)restingFrameForSwipedView:(id)a3 atIndexPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  id v7 = [WeakRetained collectionViewLayout];
  id v8 = [v7 layoutAttributesForDecorationViewOfKind:@"UICollectionViewListLayoutElementKindSwipeActions" atIndexPath:v5];

  if (os_variant_has_internal_diagnostics())
  {
    if (v8) {
      goto LABEL_3;
    }
    id v21 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      int v23 = 138412290;
      id v24 = v5;
      _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Missing layout attributes for swipe actions view at index path: %@", (uint8_t *)&v23, 0xCu);
    }

LABEL_11:
    double v10 = *MEMORY[0x1E4F1DB20];
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_4;
  }
  if (!v8)
  {
    id v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &restingFrameForSwipedView_atIndexPath____s_category) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v5;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Missing layout attributes for swipe actions view at index path: %@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_3:
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
LABEL_4:

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_swipeActionsModule);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end