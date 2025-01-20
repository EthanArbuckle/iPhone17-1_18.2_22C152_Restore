@interface _UICollectionViewMultiSelectController
- (BOOL)_allowsBandSelectionStartingAtPoint:(CGPoint)a3 multiSelectInteraction:(id)a4;
- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionAtPoint:(CGPoint)a3;
- (BOOL)_isUsingTableLayoutSPI;
- (BOOL)_point:(CGPoint)a3 liesBeyondFrame:(CGRect)a4 inDirection:(double)a5;
- (BOOL)_shouldBeginInteractionAtIndexPath:(id)a3;
- (BOOL)_shouldBeginInteractionAtPoint:(CGPoint)a3;
- (BOOL)_testTouchPolicyAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (BOOL)isEnabled;
- (BOOL)isInMultiSelectMode;
- (BOOL)isInMultiselectInteraction;
- (BOOL)multiSelectInteraction:(id)a3 shouldShowBandForSelectionStartingAtPoint:(CGPoint)a4;
- (BOOL)multiSelectInteractionGestureShouldPreventDragLiftGesture:(id)a3;
- (BOOL)shouldAllowSelectionAppendageAtPoint:(CGPoint)a3;
- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3;
- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3;
- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 ofType:(int64_t)a4 atPoint:(CGPoint)a5 withVelocity:(CGPoint)a6;
- (BOOL)supportsKeyboardSelectionExtension;
- (BOOL)supportsMultiSelectInteraction:(id)a3;
- (NSMapTable)contentMaskCache;
- (UICollectionView)collectionView;
- (UIMultiSelectInteraction)multiSelectInteraction;
- (UIMultiSelectInteractionState)selectionState;
- (_UICollectionViewMultiSelectController)initWithCollectionView:(id)a3;
- (id)_antecedentIndexPathsForLayoutAttributes:(id)a3 inDirection:(double)a4;
- (id)_autoScrollAssistantForIndexPaths:(id)a3;
- (id)_boundingScrollViewForIndexPath:(id)a3;
- (id)_collectionViewDelegate;
- (id)_indexPathsWithinRect:(CGRect)a3;
- (id)childScrollViewAtLocation:(CGPoint)a3;
- (id)indexPathsBetweenIndexPath:(id)a3 andIndexPath:(id)a4;
- (id)keyCommandsForSelectionExtension;
- (id)selectionEndIndexPath;
- (id)selectionStartIndexPath;
- (id)targetForKeyCommands;
- (int64_t)_hitTestForSystemEditControlAtPoint:(CGPoint)a3;
- (int64_t)axisConstraintAtIndexPath:(id)a3;
- (int64_t)axisConstraintAtPoint:(CGPoint)a3;
- (int64_t)axisConstraintForSingleFingerPanGestureAtPoint:(CGPoint)a3;
- (void)_autoScrollAtIndexPaths:(id)a3 fromPoint:(CGPoint)a4;
- (void)_deselectIndexPaths:(id)a3;
- (void)_extendSelectionToPoint:(CGPoint)a3;
- (void)_performWithPrewarmingCache:(id)a3;
- (void)_selectIndexPaths:(id)a3;
- (void)_updateContentMasksForVisibleCells;
- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3;
- (void)clearSelectionState;
- (void)collectionViewDidUpdateVisibleCells;
- (void)dealloc;
- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)multiSelectInteraction:(id)a3 appendSelectionAtPoint:(CGPoint)a4;
- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4;
- (void)multiSelectInteraction:(id)a3 selectItemsWithinRect:(CGRect)a4 leadingPoint:(CGPoint)a5;
- (void)multiSelectInteraction:(id)a3 toggleSelectionWithinRect:(CGRect)a4 leadingPoint:(CGPoint)a5;
- (void)selectedIndexPathsChanged:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentMaskCache:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMultiSelectInteraction:(id)a3;
- (void)setSelectionState:(id)a3;
- (void)uninstallFromCollectionView;
- (void)updateSelectedIndexPaths:(id)a3;
- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 keepCurrentSelection:(BOOL)a5;
@end

@implementation _UICollectionViewMultiSelectController

- (void)collectionViewDidUpdateVisibleCells
{
  v3 = [(_UICollectionViewMultiSelectController *)self contentMaskCache];

  if (v3)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      *(unsigned char *)&self->_flags |= 1u;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __77___UICollectionViewMultiSelectController_collectionViewDidUpdateVisibleCells__block_invoke;
      v4[3] = &unk_1E52D9F70;
      v4[4] = self;
      [(id)UIApp _performBlockAfterCATransactionCommits:v4];
    }
  }
}

- (NSMapTable)contentMaskCache
{
  return self->_contentMaskCache;
}

- (void)clearSelectionState
{
  [(_UICollectionViewMultiSelectController *)self setSelectionState:0];
  id v3 = [(_UICollectionViewMultiSelectController *)self multiSelectInteraction];
  if ([v3 isEnabled])
  {
    [v3 setEnabled:0];
    [v3 setEnabled:1];
  }
}

- (void)setSelectionState:(id)a3
{
}

- (UIMultiSelectInteraction)multiSelectInteraction
{
  return self->_multiSelectInteraction;
}

- (_UICollectionViewMultiSelectController)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewMultiSelectController;
  v5 = [(_UICollectionViewMultiSelectController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    v7 = objc_alloc_init(UIMultiSelectInteraction);
    multiSelectInteraction = v6->_multiSelectInteraction;
    v6->_multiSelectInteraction = v7;

    [(UIMultiSelectInteraction *)v6->_multiSelectInteraction setDelegate:v6];
    [(UIMultiSelectInteraction *)v6->_multiSelectInteraction setEnabled:0];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_collectionView);
    [WeakRetained addInteraction:v6->_multiSelectInteraction];

    v6->_computedAxisConstraint = 4;
  }

  return v6;
}

- (BOOL)isInMultiselectInteraction
{
  v2 = [(_UICollectionViewMultiSelectController *)self selectionState];
  char v3 = [v2 isInMultiselectInteraction];

  return v3;
}

- (UIMultiSelectInteractionState)selectionState
{
  return self->_selectionState;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)dealloc
{
  [(_UICollectionViewMultiSelectController *)self uninstallFromCollectionView];
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewMultiSelectController;
  [(_UICollectionViewMultiSelectController *)&v3 dealloc];
}

- (BOOL)isEnabled
{
  return [(UIMultiSelectInteraction *)self->_multiSelectInteraction isEnabled];
}

- (void)uninstallFromCollectionView
{
  if (self->_multiSelectInteraction)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    [WeakRetained removeInteraction:self->_multiSelectInteraction];
  }
}

- (int64_t)axisConstraintForSingleFingerPanGestureAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  int64_t v8 = [(_UICollectionViewMultiSelectController *)self axisConstraintAtIndexPath:v7];
  if (v8 == 1)
  {
    if (v7)
    {
      v9 = [v6 collectionViewLayout];
      int v10 = [v9 _supportsSwipeActionsForIndexPath:v7];

      int64_t v8 = v10 ^ 1u;
    }
    else
    {
      int64_t v8 = 1;
    }
  }

  return v8;
}

- (int64_t)axisConstraintAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(_UICollectionViewMultiSelectController *)self collectionView];
  v6 = [v5 collectionViewLayout];
  char v7 = [v6 _hasOrthogonalScrollingSections];

  if ((v7 & 1) != 0 || (int64_t computedAxisConstraint = self->_computedAxisConstraint, computedAxisConstraint == 4))
  {
    v9 = [(_UICollectionViewMultiSelectController *)self collectionView];
    int v10 = [v9 collectionViewLayout];
    char v11 = [v10 _hasOrthogonalScrollingSections];

    if ((v11 & 1) != 0
      || ([(_UICollectionViewMultiSelectController *)self collectionView],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 collectionViewLayout],
          v13 = objc_claimAutoreleasedReturnValue(),
          unint64_t v14 = [v13 _layoutAxis],
          v13,
          v12,
          v14 >= 4))
    {
      v15 = [(_UICollectionViewMultiSelectController *)self _boundingScrollViewForIndexPath:v4];
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      [v15 contentSize];
      if (v20 <= v17 || v21 > v19)
      {
        if (v21 <= v19 || v20 > v17)
        {
          if (v20 > v17 || v21 > v19) {
            int64_t computedAxisConstraint = 0;
          }
          else {
            int64_t computedAxisConstraint = 3;
          }
        }
        else
        {
          int64_t computedAxisConstraint = 1;
        }
      }
      else
      {
        int64_t computedAxisConstraint = 2;
      }
    }
    else
    {
      int64_t computedAxisConstraint = 3 - v14;
    }
    self->_int64_t computedAxisConstraint = computedAxisConstraint;
  }

  return computedAxisConstraint;
}

- (int64_t)axisConstraintAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  char v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  int64_t v8 = [(_UICollectionViewMultiSelectController *)self axisConstraintAtIndexPath:v7];
  return v8;
}

- (id)selectionStartIndexPath
{
  return [(UIMultiSelectInteractionState *)self->_selectionState startIndexPath];
}

- (id)selectionEndIndexPath
{
  return [(UIMultiSelectInteractionState *)self->_selectionState endIndexPath];
}

- (id)_autoScrollAssistantForIndexPaths:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 anyObject];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "section", (void)v19);
        if (v11 != [v5 section])
        {
          int v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int v12 = 1;
LABEL_11:

  p_collectionView = &self->_collectionView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v15 = [WeakRetained _autoScrollAssistant];

  if (v12)
  {
    id v16 = objc_loadWeakRetained((id *)p_collectionView);
    uint64_t v17 = [v16 _autoScrollAssistantForIndexPath:v5];

    v15 = (void *)v17;
  }

  return v15;
}

- (id)_boundingScrollViewForIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    v5 = [(_UICollectionViewMultiSelectController *)self _autoScrollAssistantForIndexPaths:v4];
    id v6 = [v5 scrollView];
  }
  else
  {
    id v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  }
  return v6;
}

- (id)childScrollViewAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  uint64_t v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  uint64_t v8 = [(_UICollectionViewMultiSelectController *)self _boundingScrollViewForIndexPath:v7];

  return v8;
}

- (void)_autoScrollAtIndexPaths:(id)a3 fromPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [(_UICollectionViewMultiSelectController *)self _autoScrollAssistantForIndexPaths:a3];
  if (v7)
  {
    id v14 = v7;
    uint64_t v8 = [v7 scrollView];
    uint64_t v9 = [(_UICollectionViewMultiSelectController *)self collectionView];
    objc_msgSend(v8, "convertPoint:fromView:", v9, x, y);
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v14, "autoScrollFromPoint:", v11, v13);
    uint64_t v7 = v14;
  }
}

- (id)_antecedentIndexPathsForLayoutAttributes:(id)a3 inDirection:(double)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = [v5 indexPath];
  int64_t v8 = [(_UICollectionViewMultiSelectController *)self axisConstraintAtIndexPath:v7];
  uint64_t v9 = [(_UICollectionViewMultiSelectController *)self _boundingScrollViewForIndexPath:v7];
  v32 = v9;
  if (v8 == 2)
  {
    [v9 bounds];
    char v10 = 10;
  }
  else if (v8 == 1)
  {
    [v9 bounds];
    char v10 = 5;
  }
  else
  {
    char v10 = 0;
  }
  double v11 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v12 = [v11 collectionViewLayout];

  double v13 = [(_UICollectionViewMultiSelectController *)self collectionView];
  [v13 contentScaleFactor];
  double v15 = v14;

  [v5 frame];
  v33 = v5;
  objc_msgSend(v12, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v5);
  v31 = v12;
  long long v20 = objc_msgSend(v12, "_layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:", UIRectInsetEdges(v10, v16, v17, v18, v19, v15));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v26 = [v25 indexPath];
        uint64_t v27 = [v26 section];
        uint64_t v28 = [v7 section];

        if (v27 == v28 && ![v25 representedElementCategory])
        {
          v29 = [v25 indexPath];
          [v6 addObject:v29];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }

  return v6;
}

- (BOOL)_point:(CGPoint)a3 liesBeyondFrame:(CGRect)a4 inDirection:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.y;
  double v11 = a3.x;
  int64_t v12 = -[_UICollectionViewMultiSelectController axisConstraintAtPoint:](self, "axisConstraintAtPoint:");
  if (a5 < 0.0)
  {
    if (v12 == 2)
    {
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      return v11 < CGRectGetMinX(v18);
    }
    if (v12 == 1)
    {
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      return v10 < CGRectGetMinY(v16);
    }
    return 0;
  }
  if (v12 == 2)
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    BOOL v14 = v11 <= CGRectGetMaxX(v19);
  }
  else
  {
    if (v12 != 1) {
      return 0;
    }
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    BOOL v14 = v10 <= CGRectGetMaxY(v17);
  }
  return !v14;
}

- (id)indexPathsBetweenIndexPath:(id)a3 andIndexPath:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewMultiSelectController *)self collectionView];
  uint64_t v9 = [v8 collectionViewLayout];

  double v10 = [v9 layoutAttributesForItemAtIndexPath:v6];
  [v10 frame];
  v54 = v10;
  objc_msgSend(v9, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v10);
  double v59 = v12;
  double v60 = v11;
  double v13 = v11 + v12 * 0.5;
  double v58 = v14;
  double v16 = v15;
  double v17 = v15 + v14 * 0.5;
  CGRect v18 = [(_UICollectionViewMultiSelectController *)self collectionView];
  v55 = v7;
  CGRect v19 = [v18 layoutAttributesForItemAtIndexPath:v7];

  [v19 frame];
  objc_msgSend(v9, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v19);
  double v22 = v21 + v20 * 0.5;
  double v25 = v24 + v23 * 0.5;
  v26 = [MEMORY[0x1E4F1CA80] set];
  if (v22 >= v13) {
    double v27 = v22;
  }
  else {
    double v27 = v13;
  }
  if (v22 >= v13) {
    double v28 = v13;
  }
  else {
    double v28 = v22;
  }
  if (v25 >= v17) {
    double v29 = v25;
  }
  else {
    double v29 = v17;
  }
  if (v25 >= v17) {
    double v30 = v17;
  }
  else {
    double v30 = v25;
  }
  v31 = objc_msgSend(v9, "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", v28, v30, fmax(v27 - v28, 1.0), fmax(v29 - v30, 1.0));
  v56 = v6;
  if ([(_UICollectionViewMultiSelectController *)self axisConstraintAtIndexPath:v6] == 1) {
    BOOL v32 = v25 < v17;
  }
  else {
    BOOL v32 = v22 < v13;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  if (v32) {
    double v33 = -1.0;
  }
  else {
    double v33 = 1.0;
  }
  long long v63 = 0uLL;
  long long v64 = 0uLL;
  id v34 = v31;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v65 count:16];
  double v57 = -v33;
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if (![v39 representedElementCategory])
        {
          [v39 frame];
          objc_msgSend(v9, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v39);
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;
          v48 = [v39 indexPath];
          [v26 addObject:v48];

          if (-[_UICollectionViewMultiSelectController _point:liesBeyondFrame:inDirection:](self, "_point:liesBeyondFrame:inDirection:", v41, v43, v60, v16, v59, v58, v33))
          {
            v49 = [(_UICollectionViewMultiSelectController *)self _antecedentIndexPathsForLayoutAttributes:v39 inDirection:v57];
            [v26 unionSet:v49];
          }
          if (-[_UICollectionViewMultiSelectController _point:liesBeyondFrame:inDirection:](self, "_point:liesBeyondFrame:inDirection:", v22, v25, v41, v43, v45, v47, v33))
          {
            v50 = [(_UICollectionViewMultiSelectController *)self _antecedentIndexPathsForLayoutAttributes:v39 inDirection:v33];
            [v26 unionSet:v50];
          }
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v36);
  }

  if (-[_UICollectionViewMultiSelectController _point:liesBeyondFrame:inDirection:](self, "_point:liesBeyondFrame:inDirection:", v22, v25, v60, v16, v59, v58, v33))
  {
    v51 = [(_UICollectionViewMultiSelectController *)self _antecedentIndexPathsForLayoutAttributes:v54 inDirection:v57];
    [v26 minusSet:v51];

    v52 = [(_UICollectionViewMultiSelectController *)self _antecedentIndexPathsForLayoutAttributes:v19 inDirection:v33];
    [v26 minusSet:v52];
  }
  [v26 addObject:v56];
  [v26 addObject:v55];

  return v26;
}

- (void)_extendSelectionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(_UICollectionViewMultiSelectController *)self selectionState];

  if (v6)
  {
    id v7 = [(_UICollectionViewMultiSelectController *)self selectionState];
    int64_t v8 = [v7 startIndexPath];

    if (v8)
    {
      if ((*(unsigned char *)&self->_flags & 4) == 0)
      {
        uint64_t v9 = [(_UICollectionViewMultiSelectController *)self collectionView];
        objc_msgSend(v9, "_indexPathOfItemNearestToPoint:intersectingRect:", x, y, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        double v10 = v14;
        if (v14)
        {
          double v11 = [(_UICollectionViewMultiSelectController *)self selectionState];
          double v12 = [v11 startIndexPath];

          double v13 = [(_UICollectionViewMultiSelectController *)self indexPathsBetweenIndexPath:v12 andIndexPath:v14];
          if ([v13 count])
          {
            *(unsigned char *)&self->_flags |= 4u;
            [(_UICollectionViewMultiSelectController *)self updateSelectedIndexPaths:v13];
            *(unsigned char *)&self->_flags &= ~4u;
            -[_UICollectionViewMultiSelectController _autoScrollAtIndexPaths:fromPoint:](self, "_autoScrollAtIndexPaths:fromPoint:", v13, x, y);
          }

          double v10 = v14;
        }
      }
    }
  }
}

- (void)_updateContentMasksForVisibleCells
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char flags = (char)self->_flags;
  uint64_t v5 = [(_UICollectionViewMultiSelectController *)self contentMaskCache];
  if (v5)
  {
    id v6 = (void *)v5;
    if ((flags & 1) == 0) {
      goto LABEL_27;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    [(_UICollectionViewMultiSelectController *)self setContentMaskCache:v6];
  }
  *(unsigned char *)&self->_flags &= ~1u;
  id v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
  int64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 _identityTracker:1];
    if (!v9)
    {
      double v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"_UICollectionViewMultiSelectController.m", 520, @"Invalid parameter not satisfying: %@", @"identityTracker != nil" object file lineNumber description];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v10 = [v8 visibleCells];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      double v24 = v8;
      uint64_t v25 = 0;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          double v16 = [v15 _layoutAttributes];
          double v17 = [v16 indexPath];

          CGRect v18 = -[_UIIndexPathIdentityTracker identifierForIndexPath:]((uint64_t)v9, v17);
          CGRect v19 = [v6 objectForKey:v18];

          if (!v19)
          {
            double v20 = _UIImageForView(v15);
            if (v20) {
              [v6 setObject:v20 forKey:v18];
            }
            else {
              ++v25;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v12);

      int64_t v8 = v24;
      if (v25)
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v23 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v24;
            _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "UIKit was unable to determine the content area of some of the visible cells in %@. This should never happen.", buf, 0xCu);
          }

          int64_t v8 = v24;
        }
        else
        {
          double v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateContentMasksForVisibleCells___s_category)
                             + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v24;
            _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "UIKit was unable to determine the content area of some of the visible cells in %@. This should never happen.", buf, 0xCu);
          }
        }
      }
    }
    else
    {
    }
  }

LABEL_27:
}

- (id)_indexPathsWithinRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  int64_t v8 = [(_UICollectionViewMultiSelectController *)self collectionView];
  uint64_t v9 = [v8 collectionViewLayout];
  double v10 = (void *)v9;
  id v11 = 0;
  double v46 = v8;
  if (v8 && v9)
  {
    uint64_t v12 = [(_UICollectionViewMultiSelectController *)v7 contentMaskCache];

    BOOL v13 = !v12
       && ([(_UICollectionViewMultiSelectController *)v7 _updateContentMasksForVisibleCells], [(UIMultiSelectInteraction *)v7->_multiSelectInteraction activeGestureType] == 8)&& (*(unsigned char *)&v7->_flags & 2) == 0;
    double v47 = [v46 _identityTracker:0];
    if ([v10 _hasOrthogonalScrollingSections]) {
      objc_msgSend(v10, "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", x, y, width, height);
    }
    else {
    id v14 = objc_msgSend(v10, "layoutAttributesForElementsInRect:", x, y, width, height);
    }
    if ([v14 count])
    {
      BOOL v44 = v13;
      double v45 = v7;
      double v15 = [MEMORY[0x1E4F1CA80] set];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      double v43 = v14;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (!v17) {
        goto LABEL_30;
      }
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v49;
      while (1)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(_WORD **)(*((void *)&v48 + 1) + 8 * v20);
          double v22 = [v21 indexPath];
          if (v21)
          {
            if ((v21[144] & 1) != 0 && ([v21 isHidden] & 1) == 0)
            {
              [v21 alpha];
              if (v23 > 0.0)
              {
                double v24 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)v21);

                [v21 frame];
                objc_msgSend(v10, "_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:", v21);
                if (v24) {
                  goto LABEL_24;
                }
                double v29 = v25;
                double v30 = v26;
                CGFloat v31 = v27;
                CGFloat v32 = v28;
                v55.origin.double x = x;
                v55.origin.double y = y;
                v55.size.double width = width;
                v55.size.double height = height;
                v59.origin.double x = v29;
                v59.origin.double y = v30;
                v59.size.double width = v31;
                v59.size.double height = v32;
                if (CGRectContainsRect(v55, v59)) {
                  goto LABEL_24;
                }
                uint64_t v33 = -[_UIIndexPathIdentityTracker identifierForIndexPath:]((uint64_t)v47, v22);
                id v34 = [(_UICollectionViewMultiSelectController *)v45 contentMaskCache];
                uint64_t v35 = [v34 objectForKey:v33];

                if (v35)
                {
                  v56.origin.double x = x;
                  v56.origin.double y = y;
                  v56.size.double width = width;
                  v56.size.double height = height;
                  double v36 = CGRectGetWidth(v56);
                  v57.origin.double x = x;
                  v57.origin.double y = y;
                  v57.size.double width = width;
                  v57.size.double height = height;
                  double v37 = CGRectGetHeight(v57);
                  [v46 _currentScreenScale];
                  char v39 = objc_msgSend(v35, "_hasVisibleContentInRect:atScale:", x - v29, y - v30, v36, v37, v38);

                  if ((v39 & 1) == 0) {
                    goto LABEL_25;
                  }
LABEL_24:
                  [v15 addObject:v22];
                  goto LABEL_25;
                }
                v58.origin.double x = x;
                v58.origin.double y = y;
                v58.size.double width = width;
                v58.size.double height = height;
                v60.origin.double x = v29;
                v60.origin.double y = v30;
                v60.size.double width = v31;
                v60.size.double height = v32;
                BOOL v40 = CGRectIntersectsRect(v58, v60);

                if (v40) {
                  goto LABEL_24;
                }
              }
            }
          }
LABEL_25:

          ++v20;
        }
        while (v18 != v20);
        uint64_t v41 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
        uint64_t v18 = v41;
        if (!v41)
        {
LABEL_30:

          id v7 = v45;
          id v14 = v43;
          if (v44) {
            goto LABEL_31;
          }
          goto LABEL_32;
        }
      }
    }
    double v15 = 0;
    if (v13) {
LABEL_31:
    }
      [(_UICollectionViewMultiSelectController *)v7 setContentMaskCache:0];
LABEL_32:
    id v11 = v15;
  }
  return v11;
}

- (void)multiSelectInteraction:(id)a3 selectItemsWithinRect:(CGRect)a4 leadingPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  -[_UICollectionViewMultiSelectController _indexPathsWithinRect:](self, "_indexPathsWithinRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(_UICollectionViewMultiSelectController *)self updateSelectedIndexPaths:v8];
  -[_UICollectionViewMultiSelectController _autoScrollAtIndexPaths:fromPoint:](self, "_autoScrollAtIndexPaths:fromPoint:", v8, x, y);
}

- (void)multiSelectInteraction:(id)a3 toggleSelectionWithinRect:(CGRect)a4 leadingPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  -[_UICollectionViewMultiSelectController _indexPathsWithinRect:](self, "_indexPathsWithinRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [(_UICollectionViewMultiSelectController *)self selectionState];
  double v10 = [v9 originallySelectedIndexPaths];
  id v11 = [v8 setWithArray:v10];

  uint64_t v12 = (void *)[v18 mutableCopy];
  [v12 intersectSet:v11];
  BOOL v13 = (void *)[v11 mutableCopy];
  [v13 unionSet:v18];
  [v13 minusSet:v12];
  id v14 = (void *)MEMORY[0x1E4F1CA80];
  double v15 = [(_UICollectionViewMultiSelectController *)self collectionView];
  id v16 = [v15 indexPathsForSelectedItems];
  uint64_t v17 = [v14 setWithArray:v16];

  [v17 minusSet:v13];
  [(_UICollectionViewMultiSelectController *)self _selectIndexPaths:v13];
  [(_UICollectionViewMultiSelectController *)self _deselectIndexPaths:v17];
  -[_UICollectionViewMultiSelectController _autoScrollAtIndexPaths:fromPoint:](self, "_autoScrollAtIndexPaths:fromPoint:", v18, x, y);
}

- (void)_selectIndexPaths:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  uint64_t v7 = [v6 indexPathsForSelectedItems];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  double v10 = [v4 setWithArray:v9];

  id v11 = (void *)[v5 mutableCopy];
  [v11 minusSet:v10];
  uint64_t v12 = [(_UICollectionViewMultiSelectController *)self selectionState];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60___UICollectionViewMultiSelectController__selectIndexPaths___block_invoke;
  v14[3] = &unk_1E52D9F98;
  id v15 = v11;
  id v16 = self;
  id v13 = v11;
  [v12 ignoreSelectionChangedNotificationsWithBlock:v14];
}

- (void)_deselectIndexPaths:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  uint64_t v7 = [v6 indexPathsForSelectedItems];
  id v8 = [v4 setWithArray:v7];

  uint64_t v9 = (void *)[v5 mutableCopy];
  [v9 intersectSet:v8];
  double v10 = [(_UICollectionViewMultiSelectController *)self selectionState];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62___UICollectionViewMultiSelectController__deselectIndexPaths___block_invoke;
  v12[3] = &unk_1E52D9F98;
  id v13 = v9;
  id v14 = self;
  id v11 = v9;
  [v10 ignoreSelectionChangedNotificationsWithBlock:v12];
}

- (void)updateSelectedIndexPaths:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  uint64_t v7 = [v6 indexPathsForSelectedItems];
  id v12 = [v4 setWithArray:v7];

  id v8 = [(_UICollectionViewMultiSelectController *)self selectionState];
  uint64_t v9 = [v8 pathsToSelectForInterpolatedIndexPaths:v5];

  double v10 = [(_UICollectionViewMultiSelectController *)self selectionState];
  id v11 = [v10 pathsToDeselectForInterpolatedIndexPaths:v5 currentlySelectedIndexPaths:v12];

  [(_UICollectionViewMultiSelectController *)self _selectIndexPaths:v9];
  [(_UICollectionViewMultiSelectController *)self _deselectIndexPaths:v11];
}

- (void)selectedIndexPathsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewMultiSelectController *)self selectionState];

  if (v5)
  {
    id v6 = [(_UICollectionViewMultiSelectController *)self selectionState];
    [(UIMultiSelectInteractionState *)v6 updateStateWithDifferenceFromCurrentSelection:v4];
  }
  else
  {
    id v6 = [[UIMultiSelectInteractionState alloc] initWithCurrentSelection:v4];

    [(_UICollectionViewMultiSelectController *)self setSelectionState:v6];
  }
}

- (id)_collectionViewDelegate
{
  objc_super v3 = [(_UICollectionViewMultiSelectController *)self collectionView];
  id v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
    uint64_t v7 = [v6 delegate];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (BOOL)_isUsingTableLayoutSPI
{
  v2 = [(_UICollectionViewMultiSelectController *)self collectionView];
  objc_super v3 = [v2 collectionViewLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int64_t)_hitTestForSystemEditControlAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v5 = [(_UICollectionViewMultiSelectController *)self collectionView];
  id v6 = objc_msgSend(v5, "indexPathForItemAtPoint:", x, y);
  if (v6)
  {
    uint64_t v7 = [v5 cellForItemAtIndexPath:v6];
    if (!v7)
    {
      int64_t v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 _viewForMultiSelectAccessory];
      if (!v8) {
        goto LABEL_14;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_14:
        int64_t v9 = 1;
        goto LABEL_15;
      }
      double v10 = [v7 tableViewCell];
      id v11 = [v10 editingData:0];
      id v8 = [v11 editControl:0];

      if (!v8)
      {
        id v8 = [v7 tableViewCell];
        objc_msgSend(v8, "convertPoint:fromView:", v5, x, y);
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        [v8 frame];
        v27.double x = v22;
        v27.double y = v24;
        if (CGRectContainsPoint(v28, v27)
          && (([v8 frame],
               double v25 = vabdd_f64(CGRectGetMinX(v29), x),
               [v8 frame],
               double MaxX = CGRectGetMaxX(v30),
               v25 < 70.0)
           || vabdd_f64(MaxX, x) < 70.0))
        {
          int64_t v9 = 3;
        }
        else
        {
          int64_t v9 = 1;
        }
        goto LABEL_13;
      }
    }
    objc_msgSend(v8, "convertPoint:fromView:", v5, x, y);
    double v13 = v12;
    double v15 = v14;
    [v8 bounds];
    if (sqrt((v17 + v16 * 0.5 - v13) * (v17 + v16 * 0.5 - v13) + (v19 + v18 * 0.5 - v15) * (v19 + v18 * 0.5 - v15)) >= 35.0) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 3;
    }
LABEL_13:

    goto LABEL_15;
  }
  int64_t v9 = 0;
LABEL_16:

  return v9;
}

- (id)keyCommandsForSelectionExtension
{
  return [(UIMultiSelectInteraction *)self->_multiSelectInteraction keyCommandsForSelectionExtension];
}

- (id)targetForKeyCommands
{
  return self->_multiSelectInteraction;
}

- (BOOL)supportsKeyboardSelectionExtension
{
  return 1;
}

- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  uint64_t v6 = [(_UICollectionViewMultiSelectController *)self selectionEndIndexPath];
  if (!v6)
  {
    uint64_t v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
    id v8 = [v7 indexPathsForSelectedItems];

    int64_t v9 = [v8 sortedArrayUsingSelector:sel_compare_];

    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      [v9 lastObject];
    }
    else {
    id v62 = [v9 firstObject];
    }

    uint64_t v6 = (uint64_t)v62;
    if (!v62) {
      return;
    }
  }
  id v63 = (id)v6;
  double v10 = [(_UICollectionViewMultiSelectController *)self collectionView];
  id v11 = [v10 collectionViewLayout];

  double v12 = [v11 layoutAttributesForItemAtIndexPath:v63];
  double v13 = (double *)MEMORY[0x1E4F1DAD8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  [WeakRetained visibleBounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(_UICollectionViewMultiSelectController *)self _boundingScrollViewForIndexPath:v63];
  uint64_t v24 = [(_UICollectionViewMultiSelectController *)self collectionView];
  if (v23 == (void *)v24)
  {
    double v25 = v23;
    goto LABEL_18;
  }
  double v25 = (void *)v24;
  int64_t v26 = [(_UICollectionViewMultiSelectController *)self axisConstraintAtIndexPath:v63];
  if (v26 != 2)
  {
    if (v26 == 1)
    {

      if (!a4 || a4 == 3) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    if (!v26)
    {

LABEL_17:
      double v25 = [(_UICollectionViewMultiSelectController *)self collectionView];
      [v23 visibleBounds];
      objc_msgSend(v25, "convertRect:fromView:", v23);
      double v16 = v27;
      double v18 = v28;
      double v20 = v29;
      double v22 = v30;
    }
LABEL_18:

    goto LABEL_19;
  }

  if (a4 - 1 >= 2) {
    goto LABEL_17;
  }
LABEL_19:
  double v31 = *v13;
  double v32 = v13[1];
  switch(a4)
  {
    case 0uLL:
      double v16 = v16 - v20;
      double v20 = v20 + v20;
      double v31 = -1.0;
      break;
    case 1uLL:
      double v22 = v22 + v22;
      double v32 = 1.0;
      break;
    case 2uLL:
      double v18 = v18 - v22;
      double v22 = v22 + v22;
      double v32 = -1.0;
      break;
    case 3uLL:
      double v20 = v20 + v20;
      double v31 = 1.0;
      break;
    default:
      break;
  }
  uint64_t v33 = objc_msgSend(v11, "_layoutAttributesForNextItemInDirection:fromIndexPath:constrainedToRect:", v63, v31, v32, v16, v18, v20, v22);
  id v34 = [v33 indexPath];
  if (v34)
  {
    uint64_t v35 = [(_UICollectionViewMultiSelectController *)self _boundingScrollViewForIndexPath:v34];
    [v35 bounds];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    [v33 frame];
    CGFloat x = v65.origin.x;
    CGFloat y = v65.origin.y;
    CGFloat width = v65.size.width;
    CGFloat height = v65.size.height;
    double MinY = CGRectGetMinY(v65);
    CGFloat v61 = v39;
    v66.origin.CGFloat x = v37;
    v66.origin.CGFloat y = v39;
    v66.size.CGFloat width = v41;
    v66.size.CGFloat height = v43;
    CGRect v60 = v12;
    if (MinY >= CGRectGetMinY(v66))
    {
      v67.origin.CGFloat x = x;
      CGFloat v57 = width;
      CGFloat v58 = y;
      v67.origin.CGFloat y = y;
      v67.size.CGFloat width = width;
      v67.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v67);
      v68.origin.CGFloat x = v37;
      v68.origin.CGFloat y = v61;
      v68.size.CGFloat width = v41;
      v68.size.CGFloat height = v43;
      if (MaxY <= CGRectGetMaxY(v68)) {
        uint64_t v48 = 0;
      }
      else {
        uint64_t v48 = 4;
      }
    }
    else
    {
      uint64_t v48 = 1;
    }
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = y;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v69);
    v70.origin.CGFloat x = v37;
    v70.origin.CGFloat y = v61;
    v70.size.CGFloat width = v41;
    v70.size.CGFloat height = v43;
    if (MinX >= CGRectGetMinX(v70))
    {
      v71.origin.CGFloat x = x;
      v71.origin.CGFloat y = y;
      v71.size.CGFloat width = width;
      v71.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v71);
      v72.origin.CGFloat x = v37;
      v72.origin.CGFloat y = v61;
      v72.size.CGFloat width = v41;
      v72.size.CGFloat height = v43;
      if (MaxX > CGRectGetMaxX(v72)) {
        v48 |= 0x20uLL;
      }
    }
    else
    {
      v48 |= 8uLL;
    }
    v52 = [(_UICollectionViewMultiSelectController *)self selectionState];
    uint64_t v53 = [v52 startIndexPath];

    if (v48)
    {
      id v54 = objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(v54, "_scrollToItemAtPresentationIndexPath:atScrollPosition:additionalInsets:animated:", v34, v48, 0, 0.0, 0.0, 0.0, 0.0);
    }
    CGRect v55 = [(_UICollectionViewMultiSelectController *)self selectionState];
    [v55 setEndIndexPath:v34];

    CGRect v56 = [(_UICollectionViewMultiSelectController *)self indexPathsBetweenIndexPath:v53 andIndexPath:v34];
    [(_UICollectionViewMultiSelectController *)self updateSelectedIndexPaths:v56];

    double v12 = v60;
  }
}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  id v4 = [(_UICollectionViewMultiSelectController *)self _collectionViewDelegate];

  if (v4) {
    return 1;
  }
  int v6 = dyld_program_sdk_at_least();
  uint64_t v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
  id v8 = v7;
  if (v6) {
    char v9 = [v7 allowsMultipleSelectionDuringEditing];
  }
  else {
    char v9 = [v7 _allowsMultipleSelectionDuringEditing];
  }
  BOOL v5 = v9;

  return v5;
}

- (BOOL)isInMultiSelectMode
{
  objc_super v3 = [(_UICollectionViewMultiSelectController *)self collectionView];
  if (![(_UICollectionViewMultiSelectController *)self _isUsingTableLayoutSPI])
  {
    if (dyld_program_sdk_at_least()) {
      char v4 = [v3 _allowsEffectiveMultipleSelection];
    }
    else {
      char v4 = [v3 allowsMultipleSelection];
    }
    goto LABEL_8;
  }
  if ([v3 isEditing])
  {
    char v4 = [v3 allowsSelectionDuringEditing];
LABEL_8:
    char v6 = v4;
    goto LABEL_9;
  }
  BOOL v5 = +[UIViewController viewControllerForView:v3];
  char v6 = [v5 isEditing];

LABEL_9:
  return v6;
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UICollectionViewMultiSelectController *)self multiSelectInteraction];
  uint64_t v6 = [v5 activeGestureType];

  if ([(_UICollectionViewMultiSelectController *)self isInMultiSelectMode])
  {
    if (!dyld_program_sdk_at_least() || (unint64_t)(v6 - 1) > 1) {
      return;
    }
    id v18 = [(_UICollectionViewMultiSelectController *)self collectionView];
    if (([v18 _isEditing] & 1) == 0)
    {
      uint64_t v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
      int v8 = [v7 _allowsMultipleSelectionDuringEditing];

      if (!v8) {
        return;
      }
      id v18 = [(_UICollectionViewMultiSelectController *)self collectionView];
      [v18 setEditing:1];
    }
    goto LABEL_14;
  }
  if (v3)
  {
    char v9 = [(_UICollectionViewMultiSelectController *)self collectionView];
    double v10 = [v9 indexPathsForSelectedItems];

    id v11 = [[UIMultiSelectInteractionState alloc] initWithCurrentSelection:v10];
    [(_UICollectionViewMultiSelectController *)self setSelectionState:v11];
  }
  int v12 = dyld_program_sdk_at_least();
  double v13 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v14 = v13;
  if (v12) {
    [v13 setEditing:1];
  }
  else {
    [v13 setAllowsMultipleSelection:1];
  }

  if (v3)
  {
    double v15 = (void *)MEMORY[0x1E4F1CAD0];
    id v18 = [(_UICollectionViewMultiSelectController *)self selectionState];
    double v16 = [v18 originallySelectedIndexPaths];
    double v17 = [v15 setWithArray:v16];
    [(_UICollectionViewMultiSelectController *)self _selectIndexPaths:v17];

LABEL_14:
  }
}

- (BOOL)_shouldBeginInteractionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = self;
  uint64_t v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  uint64_t v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  LOBYTE(v5) = [(_UICollectionViewMultiSelectController *)v5 _shouldBeginInteractionAtIndexPath:v7];
  return (char)v5;
}

- (BOOL)_shouldBeginInteractionAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(_UICollectionViewMultiSelectController *)self isInMultiSelectMode])
  {
    char v5 = 1;
  }
  else if (v4)
  {
    uint64_t v6 = [(_UICollectionViewMultiSelectController *)self _collectionViewDelegate];
    uint64_t v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
    char v5 = [v6 collectionView:v7 shouldBeginMultipleSelectionInteractionAtIndexPath:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  if ([(_UICollectionViewMultiSelectController *)self _isUsingTableLayoutSPI])
  {
    BOOL v10 = *MEMORY[0x1E4F1DAD8] == x && *(double *)(MEMORY[0x1E4F1DAD8] + 8) == y;
    double v11 = fabs(y);
    double v12 = fabs(x);
    if (!v10 && v11 <= v12) {
      return 0;
    }
  }
  return -[_UICollectionViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", v8, v7);
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 keepCurrentSelection:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v48 = a3;
  char v9 = [(_UICollectionViewMultiSelectController *)self collectionView];
  BOOL v10 = [v9 indexPathsForSelectedItems];

  if (x == *MEMORY[0x1E4F1DB20] && y == *(double *)(MEMORY[0x1E4F1DB20] + 8))
  {
    double v13 = 0;
  }
  else
  {
    double v12 = [(_UICollectionViewMultiSelectController *)self collectionView];
    double v13 = objc_msgSend(v12, "indexPathForItemAtPoint:", x, y);
  }
  double v14 = [(_UICollectionViewMultiSelectController *)self selectionState];

  if (!v14)
  {
    if (v5) {
      double v15 = [[UIMultiSelectInteractionState alloc] initWithCurrentSelection:v10];
    }
    else {
      double v15 = objc_alloc_init(UIMultiSelectInteractionState);
    }
    double v16 = v15;
    [(_UICollectionViewMultiSelectController *)self setSelectionState:v15];
  }
  double v17 = [(_UICollectionViewMultiSelectController *)self selectionState];
  [v17 beginMultiselectInteraction];

  if ([v48 activeGestureType] == 5
    || [v48 activeGestureType] == 6
    || [v48 activeGestureType] == 7)
  {
    BOOL v18 = [v48 activeGestureType] != 5;
    double v19 = [(_UICollectionViewMultiSelectController *)self selectionState];
    [v19 beginSelectingWithStartingIndexPath:v13 otherSelectedIndexPaths:v10 keepCurrentSelection:v18];
  }
  else
  {
    double v19 = [(_UICollectionViewMultiSelectController *)self selectionState];
    [v19 updateStateWithStartingIndexPath:v13 otherSelectedIndexPaths:v10];
  }

  double v20 = [(_UICollectionViewMultiSelectController *)self selectionState];
  double v21 = [v20 startIndexPath];

  if (v21)
  {
    double v22 = [(_UICollectionViewMultiSelectController *)self selectionState];
    uint64_t v23 = [v22 startIndexPath];

    uint64_t v24 = [(_UICollectionViewMultiSelectController *)self collectionView];
    double v25 = [v24 collectionViewLayout];

    int64_t v26 = [v25 layoutAttributesForItemAtIndexPath:v23];
    [v26 frame];
    double v29 = v28 + v27 * 0.5;
    double v32 = v31 + v30 * 0.5;
    uint64_t v33 = [(_UICollectionViewMultiSelectController *)self selectionState];
    objc_msgSend(v33, "setStartPoint:", v29, v32);

    id v34 = [(_UICollectionViewMultiSelectController *)self selectionState];
    uint64_t v35 = [v34 originallySelectedIndexPaths];

    if (!v35)
    {
      double v36 = [(_UICollectionViewMultiSelectController *)self selectionState];
      [v36 setOriginallySelectedIndexPaths:v10];
    }
    double v13 = (void *)v23;
  }
  CGFloat v37 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v38 = [v37 delegate];

  if (objc_opt_respondsToSelector())
  {
    CGFloat v39 = [(_UICollectionViewMultiSelectController *)self collectionView];
    [v38 collectionView:v39 didBeginMultipleSelectionInteractionAtIndexPath:v13];

    double v40 = [(_UICollectionViewMultiSelectController *)self selectionState];
    CGFloat v41 = [(_UICollectionViewMultiSelectController *)self collectionView];
    double v42 = [v41 indexPathsForSelectedItems];
    char v43 = [v40 stillValidForSelectedIndexPaths:v42];

    if ((v43 & 1) == 0)
    {
      BOOL v44 = (void *)MEMORY[0x1E4F1CAD0];
      double v45 = [(_UICollectionViewMultiSelectController *)self selectionState];
      double v46 = [v45 allSelectedIndexPaths];
      double v47 = [v44 setWithArray:v46];
      [(_UICollectionViewMultiSelectController *)self _selectIndexPaths:v47];
    }
  }
}

- (void)_performWithPrewarmingCache:(id)a3
{
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags | 2;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | flags & 2;
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 ofType:(int64_t)a4 atPoint:(CGPoint)a5 withVelocity:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  id v12 = a3;
  if (!-[_UICollectionViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", v9, v8))goto LABEL_11; {
  BOOL v13 = [(_UICollectionViewMultiSelectController *)self isInMultiSelectMode];
  }
  if (a4 != 5)
  {
    if (a4)
    {
      BOOL v14 = 1;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!-[_UICollectionViewMultiSelectController _allowsBandSelectionStartingAtPoint:multiSelectInteraction:](self, "_allowsBandSelectionStartingAtPoint:multiSelectInteraction:", v12, v9, v8))
  {
LABEL_9:
    if (v13)
    {
      BOOL v14 = -[_UICollectionViewMultiSelectController _testTouchPolicyAtPoint:withVelocity:](self, "_testTouchPolicyAtPoint:withVelocity:", v9, v8, x, y);
      goto LABEL_12;
    }
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104___UICollectionViewMultiSelectController_shouldBeginMultiSelectInteraction_ofType_atPoint_withVelocity___block_invoke;
  v16[3] = &unk_1E52EE808;
  v16[4] = self;
  v16[5] = &v17;
  *(double *)&v16[6] = v9;
  *(double *)&v16[7] = v8;
  [(_UICollectionViewMultiSelectController *)self _performWithPrewarmingCache:v16];
  if (v13 && *((unsigned char *)v18 + 24))
  {
    BOOL v14 = 1;
  }
  else
  {
    [(_UICollectionViewMultiSelectController *)self setContentMaskCache:0];
    BOOL v14 = 0;
  }
  _Block_object_dispose(&v17, 8);
LABEL_12:

  return v14;
}

- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  if (v7)
  {
    double v8 = [(_UICollectionViewMultiSelectController *)self collectionView];
    double v9 = [v8 collectionViewLayout];
    char v10 = objc_msgSend(v9, "_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:", objc_msgSend(v7, "section"));
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_testTouchPolicyAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  int64_t v9 = -[_UICollectionViewMultiSelectController _hitTestForSystemEditControlAtPoint:](self, "_hitTestForSystemEditControlAtPoint:");
  if (v9 == 3) {
    return 1;
  }
  if (v9 != 1) {
    return 0;
  }
  char v10 = [(_UICollectionViewMultiSelectController *)self collectionView];
  if (![v10 _isEditing])
  {

    return 0;
  }
  BOOL v11 = -[_UICollectionViewMultiSelectController _allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionAtPoint:](self, "_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionAtPoint:", v7, v6);

  if (!v11) {
    return 0;
  }
  int64_t v12 = -[_UICollectionViewMultiSelectController axisConstraintForSingleFingerPanGestureAtPoint:](self, "axisConstraintForSingleFingerPanGestureAtPoint:", v7, v6);
  if (v12 == 1)
  {
LABEL_14:
    double v16 = fabs(x);
    double v17 = fabs(y);
    return v16 > v17;
  }
  if (v12 != 2)
  {
    if (v12 != 3) {
      return 0;
    }
    BOOL v13 = [(_UICollectionViewMultiSelectController *)self collectionView];
    BOOL v14 = [v13 collectionViewLayout];
    uint64_t v15 = [v14 _layoutAxis];

    if (v15 != 2)
    {
      if (v15 == 1) {
        goto LABEL_10;
      }
      return 0;
    }
    goto LABEL_14;
  }
LABEL_10:
  double v16 = fabs(y);
  double v17 = fabs(x);
  return v16 > v17;
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  self->_int64_t computedAxisConstraint = 4;
  BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(UIMultiSelectInteractionState *)self->_selectionState allSelectedIndexPaths];
  double v7 = [v5 setWithArray:v6];
  double v8 = [(_UICollectionViewMultiSelectController *)self _autoScrollAssistantForIndexPaths:v7];
  [v8 stop];

  int64_t v9 = [(_UICollectionViewMultiSelectController *)self _collectionViewDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    char v10 = [(_UICollectionViewMultiSelectController *)self _collectionViewDelegate];
    BOOL v11 = [(_UICollectionViewMultiSelectController *)self collectionView];
    [v10 collectionViewDidEndMultipleSelectionInteraction:v11];
  }
  int64_t v12 = [(_UICollectionViewMultiSelectController *)self selectionState];
  [v12 endMultiselectInteraction];

  [(_UICollectionViewMultiSelectController *)self setContentMaskCache:0];
}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = self;
  uint64_t v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  LOBYTE(v5) = [(_UICollectionViewMultiSelectController *)v5 shouldAllowSelectionExtensionAtIndexPath:v7];
  return (char)v5;
}

- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = [(_UICollectionViewMultiSelectController *)self collectionView];
    uint64_t v6 = [v5 indexPathsForSelectedItems];
    id v4 = [v6 lastObject];
  }
  double v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v8 = [v7 indexPathsForSelectedItems];
  if ([v8 count]) {
    BOOL v9 = [(_UICollectionViewMultiSelectController *)self _shouldBeginInteractionAtIndexPath:v4];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldAllowSelectionAppendageAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (dyld_program_sdk_at_least())
  {
    return -[_UICollectionViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", x, y);
  }
  else
  {
    return -[_UICollectionViewMultiSelectController shouldAllowSelectionExtensionAtPoint:](self, "shouldAllowSelectionExtensionAtPoint:", x, y);
  }
}

- (void)multiSelectInteraction:(id)a3 appendSelectionAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  double v8 = v13;
  if (v13)
  {
    BOOL v9 = [(_UICollectionViewMultiSelectController *)self selectionState];
    int v10 = [v9 isSelecting];

    BOOL v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
    if (v10) {
      [(_UICollectionViewMultiSelectController *)self _selectIndexPaths:v11];
    }
    else {
      [(_UICollectionViewMultiSelectController *)self _deselectIndexPaths:v11];
    }

    int64_t v12 = [(_UICollectionViewMultiSelectController *)self selectionState];
    [v12 setStartIndexPath:v13];

    double v8 = v13;
  }
}

- (BOOL)multiSelectInteractionGestureShouldPreventDragLiftGesture:(id)a3
{
  id v4 = a3;
  if ([(_UICollectionViewMultiSelectController *)self _isUsingTableLayoutSPI])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(_UICollectionViewMultiSelectController *)self collectionView];
    [v4 locationInView:v6];
    double v8 = v7;
    double v10 = v9;

    BOOL v5 = -[_UICollectionViewMultiSelectController _hitTestForSystemEditControlAtPoint:](self, "_hitTestForSystemEditControlAtPoint:", v8, v10) == 3;
  }

  return v5;
}

- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  double v8 = [v7 set];
  [(_UICollectionViewMultiSelectController *)self updateSelectedIndexPaths:v8];

  -[_UICollectionViewMultiSelectController didEndMultiSelectInteraction:atPoint:](self, "didEndMultiSelectInteraction:atPoint:", v9, x, y);
}

- (BOOL)multiSelectInteraction:(id)a3 shouldShowBandForSelectionStartingAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v8 = objc_msgSend(v7, "_indexPathOfItemNearestToPoint:intersectingRect:", x, y, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  if (v8)
  {
    id v9 = [(_UICollectionViewMultiSelectController *)self collectionView];
    double v10 = [v9 collectionViewLayout];
    char v11 = objc_msgSend(v10, "_wantsBandSelectionVisualsInSection:", objc_msgSend(v8, "section"));
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)_allowsBandSelectionStartingAtPoint:(CGPoint)a3 multiSelectInteraction:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = [(_UICollectionViewMultiSelectController *)self collectionView];
  int v8 = [v7 _allowsBandSelectionForMultipleSelection];

  if (!v8) {
    return 0;
  }
  id v9 = [(_UICollectionViewMultiSelectController *)self collectionView];
  double v10 = objc_msgSend(v9, "hitTest:withEvent:", 0, x, y);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = 0;
  }
  else
  {
    int64_t v12 = [(_UICollectionViewMultiSelectController *)self collectionView];
    id v13 = objc_msgSend(v12, "_indexPathOfItemNearestToPoint:intersectingRect:", x, y, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

    BOOL v11 = v13 != 0;
  }

  return v11;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setMultiSelectInteraction:(id)a3
{
}

- (void)setContentMaskCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMaskCache, 0);
  objc_storeStrong((id *)&self->_selectionState, 0);
  objc_storeStrong((id *)&self->_multiSelectInteraction, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end