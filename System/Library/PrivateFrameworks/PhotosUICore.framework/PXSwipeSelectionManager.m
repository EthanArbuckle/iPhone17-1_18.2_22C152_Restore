@interface PXSwipeSelectionManager
- (BOOL)_isSelecting;
- (BOOL)_shouldBeginMultiSelectAtLocation:(CGPoint)a3;
- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4;
- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (BOOL)isInMultiSelectMode;
- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3;
- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3;
- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (BOOL)supportsKeyboardSelectionExtension;
- (BOOL)supportsMultiSelectInteraction:(id)a3;
- (NSArray)gesturesForFailureRequirements;
- (NSArray)keyCommandsForSelectionExtension;
- (PXIndexPathSet)_selectedIndexPathsBeforeSwipe;
- (PXSectionedSelectionManager)selectionManager;
- (PXSimpleIndexPath)_currentIndexPath;
- (PXSimpleIndexPath)_itemIndexPathAtLocation:(SEL)a3;
- (PXSimpleIndexPath)_itemIndexPathClosestAboveLocation:(SEL)a3;
- (PXSimpleIndexPath)_itemIndexPathClosestLeadingLocation:(SEL)a3;
- (PXSimpleIndexPath)_startingIndexPath;
- (PXSwipeSelectionManager)init;
- (PXSwipeSelectionManager)initWithSelectionManager:(id)a3 scrollView:(id)a4;
- (PXSwipeSelectionManagerDelegate)delegate;
- (PXUIAutoScroller)_autoScroller;
- (UIMultiSelectInteraction)multiSelectInteraction;
- (UIScrollView)scrollView;
- (id)_pausingChangesToken;
- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3;
- (id)targetForKeyCommands;
- (int64_t)_currentDataSourceIdentifier;
- (unint64_t)state;
- (void)_beginSelectionFromIndexPath:(PXSimpleIndexPath *)a3;
- (void)_endSelection;
- (void)_invalidateSelectedIndexPaths;
- (void)_setCurrentDataSourceIdentifier:(int64_t)a3;
- (void)_setCurrentIndexPath:(PXSimpleIndexPath *)a3;
- (void)_setPausingChangesToken:(id)a3;
- (void)_setSelectedIndexPathsBeforeSwipe:(id)a3;
- (void)_setStartingIndexPath:(PXSimpleIndexPath *)a3;
- (void)_setState:(unint64_t)a3;
- (void)_updateSelectedIndexPaths;
- (void)_updateSelectionWithHitIndexPath:(PXSimpleIndexPath *)a3 leadingClosestIndexPath:(PXSimpleIndexPath *)a4 aboveClosestIndexPath:(PXSimpleIndexPath *)a5;
- (void)_updateWithDataSource:(id)a3 changeHistory:(id)a4;
- (void)autoScroller:(id)a3 didAutoscrollWithTimestamp:(double)a4;
- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3;
- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4;
- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)removeFromView;
- (void)setDelegate:(id)a3;
- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
@end

@implementation PXSwipeSelectionManager

- (BOOL)supportsKeyboardSelectionExtension
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToItemIndexPathAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToItemIndexPathClosestLeadingLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToItemIndexPathClosestAboveLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldSelectItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldBeginSelectionAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldAutomaticallyTransitionToMultiSelectModeAtPoint = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToAutomaticallyTransitionToMultiSelectMode = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToIndexPathSetFromIndexPathToIndexPath = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToExtendSelectionInDirection = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidAutoScroll = objc_opt_respondsToSelector() & 1;
  }
}

- (NSArray)keyCommandsForSelectionExtension
{
  char v3 = objc_opt_respondsToSelector();
  id v4 = (id)MEMORY[0x1E4F1CBF0];
  if (v3)
  {
    uint64_t v5 = [(UIMultiSelectInteraction *)self->_multiSelectInteraction keyCommandsForSelectionExtension];
    v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = v4;
    }
    id v4 = v7;
  }
  return (NSArray *)v4;
}

- (PXSwipeSelectionManager)initWithSelectionManager:(id)a3 scrollView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXSwipeSelectionManager;
  v9 = [(PXSwipeSelectionManager *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_selectionManager, a3);
    objc_storeStrong((id *)&v10->_scrollView, a4);
    v11 = (UIMultiSelectInteraction *)objc_alloc_init(MEMORY[0x1E4FB19C0]);
    multiSelectInteraction = v10->_multiSelectInteraction;
    v10->_multiSelectInteraction = v11;

    [(UIMultiSelectInteraction *)v10->_multiSelectInteraction setDelegate:v10];
    [(UIMultiSelectInteraction *)v10->_multiSelectInteraction setSingleTouchPanGestureHysteresis:5.0];
    [v8 addInteraction:v10->_multiSelectInteraction];
    v13 = [(PXAutoScroller *)[PXUIAutoScroller alloc] initWithTargetScrollView:v8];
    autoScroller = v10->__autoScroller;
    v10->__autoScroller = v13;

    [(PXAutoScroller *)v10->__autoScroller setDelegate:v10];
    v10->__currentDataSourceIdentifier = *(void *)off_1E5DAAED8;
    v15 = [v7 dataSourceManager];
    [v15 registerChangeObserver:v10 context:PXSwipeSelectionManagerDataSourceObserverContext];
  }
  return v10;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((v6 & 1) != 0 && (void *)PXSwipeSelectionManagerDataSourceObserverContext == a5)
  {
    id v11 = v8;
    v9 = [v8 dataSource];
    v10 = [v11 changeHistory];
    [(PXSwipeSelectionManager *)self _updateWithDataSource:v9 changeHistory:v10];

    id v8 = v11;
  }
}

- (void)_updateWithDataSource:(id)a3 changeHistory:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PXSwipeSelectionManager *)self _currentDataSourceIdentifier];
  if (v8 != *(void *)off_1E5DAAED8)
  {
    int64_t v9 = v8;
    uint64_t v10 = [v6 identifier];
    id v11 = [v7 changeDetailsFromDataSourceIdentifier:v9 toDataSourceIdentifier:v10];
    long long v29 = 0u;
    long long v30 = 0u;
    [(PXSwipeSelectionManager *)self _startingIndexPath];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = v29;
    long long v26 = v30;
    [off_1E5DA8488 indexPathAfterApplyingChanges:v11 toIndexPath:&v25 hasIncrementalChanges:0 objectChanged:0];
    long long v25 = v27;
    long long v26 = v28;
    [(PXSwipeSelectionManager *)self _setStartingIndexPath:&v25];
    v12 = [(PXSwipeSelectionManager *)self _selectedIndexPathsBeforeSwipe];
    v13 = [off_1E5DA8488 indexPathSetAfterApplyingChanges:v11 toIndexPathSet:v12 hasIncrementalChanges:0];
    [(PXSwipeSelectionManager *)self _setSelectedIndexPathsBeforeSwipe:v13];
    [(PXSwipeSelectionManager *)self _setCurrentDataSourceIdentifier:v10];
    if (v10 != (void)v27)
    {
      [(PXSwipeSelectionManager *)self _endSelection];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v14 = [(PXSwipeSelectionManager *)self multiSelectInteraction];
      v15 = [v14 gesturesForFailureRequirements];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            [v20 setEnabled:0];
            [v20 setEnabled:1];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v31 count:16];
        }
        while (v17);
      }
    }
  }
}

- (int64_t)_currentDataSourceIdentifier
{
  return self->__currentDataSourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectInteraction, 0);
  objc_storeStrong((id *)&self->__autoScroller, 0);
  objc_storeStrong(&self->__pausingChangesToken, 0);
  objc_storeStrong((id *)&self->__selectedIndexPathsBeforeSwipe, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIMultiSelectInteraction)multiSelectInteraction
{
  return self->_multiSelectInteraction;
}

- (PXUIAutoScroller)_autoScroller
{
  return self->__autoScroller;
}

- (void)_setPausingChangesToken:(id)a3
{
}

- (id)_pausingChangesToken
{
  return self->__pausingChangesToken;
}

- (void)_setSelectedIndexPathsBeforeSwipe:(id)a3
{
}

- (PXIndexPathSet)_selectedIndexPathsBeforeSwipe
{
  return self->__selectedIndexPathsBeforeSwipe;
}

- (PXSimpleIndexPath)_currentIndexPath
{
  long long v3 = *(_OWORD *)&self[4].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[4].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)_setStartingIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->__startingIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->__startingIndexPath.item = v3;
}

- (PXSimpleIndexPath)_startingIndexPath
{
  long long v3 = *(_OWORD *)&self[3].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)_setCurrentDataSourceIdentifier:(int64_t)a3
{
  self->__currentDataSourceIdentifier = a3;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)_setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (PXSwipeSelectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSwipeSelectionManagerDelegate *)WeakRetained;
}

- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  if (self->_delegateFlags.respondsToExtendSelectionInDirection)
  {
    if (a4 > 3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = qword_1AB35C138[a4];
    }
    id v6 = [(PXSwipeSelectionManager *)self delegate];
    [v6 swipeSelectionManager:self extendSelectionInDirection:v5];
  }
}

- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3
{
  return 1;
}

- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  if ([(PXSwipeSelectionManager *)self _isSelecting])
  {
    [(PXSwipeSelectionManager *)self _endSelection];
  }
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  if ([(PXSwipeSelectionManager *)self _isSelecting])
  {
    [(PXSwipeSelectionManager *)self _endSelection];
  }
}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  long long v19 = 0u;
  long long v20 = 0u;
  -[PXSwipeSelectionManager _itemIndexPathAtLocation:](self, "_itemIndexPathAtLocation:", a3, a4.x);
  long long v17 = 0u;
  long long v18 = 0u;
  -[PXSwipeSelectionManager _itemIndexPathClosestLeadingLocation:](self, "_itemIndexPathClosestLeadingLocation:", x, y);
  long long v15 = 0u;
  long long v16 = 0u;
  -[PXSwipeSelectionManager _itemIndexPathClosestAboveLocation:](self, "_itemIndexPathClosestAboveLocation:", x, y);
  uint64_t v7 = *(void *)off_1E5DAAED8;
  if (*(void *)off_1E5DAAED8)
  {
    if ((void)v19 == v7) {
      goto LABEL_9;
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = (void)v15 == (void)v17;
    if ((void)v19 == (void)v17)
    {
      if ((void)v15 == (void)v17) {
        return;
      }
LABEL_9:
      if (![(PXSwipeSelectionManager *)self _isSelecting]) {
        return;
      }
      goto LABEL_10;
    }
  }
  [(PXSwipeSelectionManager *)self _startingIndexPath];
  if (v14 == v7 && !v8) {
    goto LABEL_9;
  }
  if (v14 == v7) {
    return;
  }
LABEL_10:
  v13[0] = v19;
  v13[1] = v20;
  v12[0] = v17;
  v12[1] = v18;
  v11[0] = v15;
  v11[1] = v16;
  [(PXSwipeSelectionManager *)self _updateSelectionWithHitIndexPath:v13 leadingClosestIndexPath:v12 aboveClosestIndexPath:v11];
  int64_t v9 = [(PXSwipeSelectionManager *)self _autoScroller];
  uint64_t v10 = [(PXSwipeSelectionManager *)self scrollView];
  objc_msgSend(v9, "updateWithUserInteractionLocation:inCoordinateSpace:", v10, x, y);
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  if (![(PXSwipeSelectionManager *)self _isSelecting]) {
    PXPointIsValid();
  }
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  BOOL v10 = [(PXSwipeSelectionManager *)self isInMultiSelectMode];
  if (v10)
  {
    BOOL v11 = -[PXSwipeSelectionManager _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
    BOOL v12 = fabs(x) > fabs(y);
    LOBYTE(v10) = v11 && v12;
  }
  return v10;
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  BOOL v10 = +[PXGridSettings sharedInstance];
  if (![v10 enableAutomaticTransitionToSelectMode])
  {

    return 0;
  }
  BOOL respondsToAutomaticallyTransitionToMultiSelectMode = self->_delegateFlags.respondsToAutomaticallyTransitionToMultiSelectMode;

  if (!respondsToAutomaticallyTransitionToMultiSelectMode) {
    return 0;
  }
  if (self->_delegateFlags.respondsToShouldAutomaticallyTransitionToMultiSelectModeAtPoint)
  {
    BOOL v12 = [(PXSwipeSelectionManager *)self delegate];
    int v13 = objc_msgSend(v12, "swipeSelectionManager:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:", self, v8, v7);

    if (!v13) {
      return 0;
    }
  }
  BOOL v14 = -[PXSwipeSelectionManager _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
  BOOL v15 = fabs(x) > fabs(y);
  return v14 && v15;
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  return -[PXSwipeSelectionManager interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:](self, "interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:", a3, a4.x, a4.y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  if (self->_delegateFlags.respondsToAutomaticallyTransitionToMultiSelectMode)
  {
    id v4 = [(PXSwipeSelectionManager *)self delegate];
    [v4 swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:self];
  }
}

- (BOOL)isInMultiSelectMode
{
  v2 = self;
  long long v3 = [(PXSwipeSelectionManager *)self delegate];
  LOBYTE(v2) = [v3 swipeSelectionManagerIsInMultiSelectMode:v2];

  return (char)v2;
}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  return 1;
}

- (BOOL)_shouldBeginMultiSelectAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_delegateFlags.respondsToShouldBeginSelectionAtLocation)
  {
    id v6 = [(PXSwipeSelectionManager *)self delegate];
    int v7 = objc_msgSend(v6, "swipeSelectionManager:shouldBeginSelectionAtLocation:", self, x, y);

    if (!v7) {
      return 0;
    }
  }
  -[PXSwipeSelectionManager _itemIndexPathAtLocation:](self, "_itemIndexPathAtLocation:", x, y);
  uint64_t v8 = v12;
  long long v15 = v13;
  uint64_t v16 = v14;
  if (v12 == *(void *)off_1E5DAAED8) {
    return 0;
  }
  if (!self->_delegateFlags.respondsToShouldSelectItemAtIndexPath) {
    return 1;
  }
  BOOL v10 = [(PXSwipeSelectionManager *)self delegate];
  uint64_t v12 = v8;
  long long v13 = v15;
  uint64_t v14 = v16;
  char v9 = [v10 swipeSelectionManager:self shouldSelectItemAtIndexPath:&v12];

  return v9;
}

- (void)autoScroller:(id)a3 didAutoscrollWithTimestamp:(double)a4
{
  if (self->_delegateFlags.respondsToDidAutoScroll)
  {
    id v5 = [(PXSwipeSelectionManager *)self delegate];
    [v5 swipeSelectionManagerDidAutoScroll:self];
  }
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)_updateSelectedIndexPaths
{
  if (self->_needsUpdateFlags.selectedIndexPaths)
  {
    self->_needsUpdateFlags.selectedIndexPaths = 0;
    long long v3 = [(PXSwipeSelectionManager *)self _selectedIndexPathsBeforeSwipe];
    if (!v3)
    {
LABEL_19:

      return;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    [(PXSwipeSelectionManager *)self _startingIndexPath];
    long long v25 = 0u;
    long long v26 = 0u;
    [(PXSwipeSelectionManager *)self _currentIndexPath];
    id v4 = [(PXSwipeSelectionManager *)self selectionManager];
    id v5 = [v4 dataSourceManager];
    id v6 = [v5 dataSource];

    if (*(void *)off_1E5DAAED8) {
      BOOL v7 = (void)v25 == *(void *)off_1E5DAAED8;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      uint64_t v8 = [off_1E5DA6F50 indexPathSet];
    }
    else
    {
      if (self->_delegateFlags.respondsToIndexPathSetFromIndexPathToIndexPath)
      {
        char v9 = [(PXSwipeSelectionManager *)self delegate];
        long long v24 = v28;
        long long v21 = v25;
        long long v22 = v26;
        long long v23 = v27;
        BOOL v10 = [v9 swipeSelectionManager:self indexPathSetFromIndexPath:&v23 toIndexPath:&v21];

LABEL_13:
        if (self->_delegateFlags.respondsToShouldSelectItemAtIndexPath)
        {
          BOOL v11 = [off_1E5DA7430 indexPathSet];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke;
          v19[3] = &unk_1E5DCA3B8;
          v19[4] = self;
          id v20 = v11;
          id v12 = v11;
          [v10 enumerateAllIndexPathsUsingBlock:v19];
          long long v13 = (void *)[v10 mutableCopy];
          [v13 minusIndexPathSet:v12];

          BOOL v10 = v13;
        }
        uint64_t v14 = (void *)[v3 mutableCopy];
        if ([(PXSwipeSelectionManager *)self state] == 1) {
          [v14 unionIndexPathSet:v10];
        }
        else {
          [v14 minusIndexPathSet:v10];
        }
        long long v15 = [(PXSwipeSelectionManager *)self selectionManager];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke_2;
        v17[3] = &unk_1E5DC9F28;
        id v18 = v14;
        id v16 = v14;
        [v15 performChanges:v17];

        goto LABEL_19;
      }
      long long v24 = v28;
      long long v21 = v25;
      long long v22 = v26;
      long long v23 = v27;
      uint64_t v8 = [v6 indexPathSetFromIndexPath:&v23 toIndexPath:&v21];
    }
    BOOL v10 = (void *)v8;
    goto LABEL_13;
  }
}

void __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke(uint64_t a1, long long *a2)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = a2[1];
  long long v10 = *a2;
  long long v11 = v6;
  char v7 = [v4 swipeSelectionManager:v5 shouldSelectItemAtIndexPath:&v10];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    long long v9 = a2[1];
    long long v10 = *a2;
    long long v11 = v9;
    [v8 addIndexPath:&v10];
  }
}

uint64_t __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

- (void)_invalidateSelectedIndexPaths
{
  self->_needsUpdateFlags.selectedIndexPaths = 1;
}

- (void)_setCurrentIndexPath:(PXSimpleIndexPath *)a3
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->__currentIndexPath.dataSourceIdentifier, *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->__currentIndexPath.item, *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    long long v4 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->__currentIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->__currentIndexPath.item = v4;
    [(PXSwipeSelectionManager *)self _invalidateSelectedIndexPaths];
    [(PXSwipeSelectionManager *)self _updateSelectedIndexPaths];
  }
}

- (void)_endSelection
{
  [(PXSwipeSelectionManager *)self _setState:0];
  [(PXSwipeSelectionManager *)self _setCurrentDataSourceIdentifier:*(void *)off_1E5DAAED8];
  [(PXSwipeSelectionManager *)self _setSelectedIndexPathsBeforeSwipe:0];
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v9 = *(_OWORD *)off_1E5DAB028;
  long long v7 = v9;
  long long v10 = v8;
  [(PXSwipeSelectionManager *)self _setStartingIndexPath:&v9];
  long long v9 = v7;
  long long v10 = v8;
  [(PXSwipeSelectionManager *)self _setCurrentIndexPath:&v9];
  long long v3 = [(PXSwipeSelectionManager *)self _autoScroller];
  [v3 stop];

  long long v4 = [(PXSwipeSelectionManager *)self _pausingChangesToken];

  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    long long v6 = [(PXSwipeSelectionManager *)self _pausingChangesToken];
    objc_msgSend(v5, "px_endPausingChanges:", v6);

    [(PXSwipeSelectionManager *)self _setPausingChangesToken:0];
  }
}

- (void)_updateSelectionWithHitIndexPath:(PXSimpleIndexPath *)a3 leadingClosestIndexPath:(PXSimpleIndexPath *)a4 aboveClosestIndexPath:(PXSimpleIndexPath *)a5
{
  [(PXSwipeSelectionManager *)self _startingIndexPath];
  uint64_t v10 = *(void *)off_1E5DAAED8;
  if (v23 == *(void *)off_1E5DAAED8)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PXSwipeSelectionManager.m" lineNumber:202 description:@"Starting indexPath should be set"];
  }
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  int64_t v12 = a4->dataSourceIdentifier;
  int64_t v13 = a5->dataSourceIdentifier;
  long long v21 = 0u;
  long long v22 = 0u;
  if ([(PXSwipeSelectionManager *)self _isSelecting])
  {
    [(PXSwipeSelectionManager *)self _currentIndexPath];
  }
  else
  {
    long long v14 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v21 = *(_OWORD *)off_1E5DAB028;
    long long v22 = v14;
  }
  if (dataSourceIdentifier != v10 || v12 != v10 || v13 != v10)
  {
    if (v12 == v10) {
      long long v17 = a5;
    }
    else {
      long long v17 = a4;
    }
    if (dataSourceIdentifier != v10) {
      long long v17 = a3;
    }
    long long v18 = *(_OWORD *)&v17->item;
    long long v21 = *(_OWORD *)&v17->dataSourceIdentifier;
    long long v22 = v18;
  }
  v20[0] = v21;
  v20[1] = v22;
  [(PXSwipeSelectionManager *)self _setCurrentIndexPath:v20];
}

- (void)_beginSelectionFromIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  long long v6 = objc_msgSend(v5, "px_beginPausingChangesWithTimeout:identifier:", @"PXSwipeSelectionManager", 60.0);
  [(PXSwipeSelectionManager *)self _setPausingChangesToken:v6];
  long long v7 = [(PXSwipeSelectionManager *)self selectionManager];
  long long v8 = [v7 selectionSnapshot];
  long long v9 = [v8 selectedIndexPaths];

  [(PXSwipeSelectionManager *)self _setSelectedIndexPathsBeforeSwipe:v9];
  long long v10 = *(_OWORD *)&a3->item;
  long long v16 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v17 = v10;
  [(PXSwipeSelectionManager *)self _setStartingIndexPath:&v16];
  long long v11 = [(PXSwipeSelectionManager *)self selectionManager];
  int64_t v12 = [v11 selectionSnapshot];
  int64_t v13 = [v12 dataSource];
  -[PXSwipeSelectionManager _setCurrentDataSourceIdentifier:](self, "_setCurrentDataSourceIdentifier:", [v13 identifier]);

  long long v14 = *(_OWORD *)&a3->item;
  long long v16 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v17 = v14;
  if ([v9 containsIndexPath:&v16]) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  [(PXSwipeSelectionManager *)self _setState:v15];
}

- (BOOL)_isSelecting
{
  return [(PXSwipeSelectionManager *)self state] != 0;
}

- (PXSimpleIndexPath)_itemIndexPathClosestAboveLocation:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v7;
  if (BYTE3(self->section))
  {
    long long v8 = self;
    long long v9 = [(PXSimpleIndexPath *)self delegate];
    long long v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "swipeSelectionManager:itemIndexPathClosestAboveLocation:", v8, x, y);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v11;
    *(_OWORD *)&retstr->item = v12;
  }
  return self;
}

- (PXSimpleIndexPath)_itemIndexPathClosestLeadingLocation:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v7;
  if (BYTE2(self->section))
  {
    long long v8 = self;
    long long v9 = [(PXSimpleIndexPath *)self delegate];
    long long v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "swipeSelectionManager:itemIndexPathClosestLeadingLocation:", v8, x, y);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v11;
    *(_OWORD *)&retstr->item = v12;
  }
  return self;
}

- (PXSimpleIndexPath)_itemIndexPathAtLocation:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v7;
  if (BYTE1(self->section))
  {
    long long v8 = self;
    long long v9 = [(PXSimpleIndexPath *)self delegate];
    long long v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "swipeSelectionManager:itemIndexPathAtLocation:", v8, x, y);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v11;
    *(_OWORD *)&retstr->item = v12;
  }
  return self;
}

- (id)targetForKeyCommands
{
  if (self->_multiSelectInteraction) {
    self = (PXSwipeSelectionManager *)self->_multiSelectInteraction;
  }
  return self;
}

- (NSArray)gesturesForFailureRequirements
{
  v2 = [(UIMultiSelectInteraction *)self->_multiSelectInteraction gesturesForFailureRequirements];
  long long v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  long long v4 = v2;

  return v4;
}

- (void)removeFromView
{
  long long v3 = [(UIMultiSelectInteraction *)self->_multiSelectInteraction view];
  [v3 removeInteraction:self->_multiSelectInteraction];

  multiSelectInteraction = self->_multiSelectInteraction;
  self->_multiSelectInteraction = 0;
}

- (PXSwipeSelectionManager)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXSwipeSelectionManager.m" lineNumber:97 description:@"Not supported"];

  abort();
}

@end