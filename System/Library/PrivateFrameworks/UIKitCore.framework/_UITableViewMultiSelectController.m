@interface _UITableViewMultiSelectController
- (BOOL)_isPointInsideEditControl:(CGPoint)a3;
- (BOOL)_shouldBeginInteractionAtIndexPath:(id)a3;
- (BOOL)_shouldBeginInteractionAtPoint:(CGPoint)a3;
- (BOOL)isInMultiSelectMode;
- (BOOL)isInMultiselectInteraction;
- (BOOL)multiSelectInteractionGestureShouldPreventDragLiftGesture:(id)a3;
- (BOOL)shouldAllowSelectionAppendageAtPoint:(CGPoint)a3;
- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3;
- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3;
- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 ofType:(int64_t)a4 atPoint:(CGPoint)a5 withVelocity:(CGPoint)a6;
- (BOOL)supportsKeyboardSelectionExtension;
- (BOOL)supportsMultiSelectInteraction:(id)a3;
- (UIMultiSelectInteraction)multiSelectInteraction;
- (UIMultiSelectInteractionState)currentSelectionState;
- (UITableView)tableView;
- (_UITableViewMultiSelectController)initWithTableView:(id)a3;
- (id)_tableViewDelegate;
- (id)keyCommandsForSelectionExtension;
- (id)targetForKeyCommands;
- (void)_adjustSelectionRangeToIndexPath:(id)a3 isDeselecting:(BOOL)a4;
- (void)_deselectIndexPaths:(id)a3;
- (void)_endAutoScroll;
- (void)_handleAutoScrollFromPoint:(CGPoint)a3;
- (void)_selectIndexPaths:(id)a3;
- (void)_updateSelectedIndexPaths:(id)a3;
- (void)_updateSelectedIndexPathsForCurrentSelection;
- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3;
- (void)clearSelectionState;
- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)multiSelectInteraction:(id)a3 appendSelectionAtPoint:(CGPoint)a4;
- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4;
- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4;
- (void)selectedIndexPathsChanged:(id)a3;
- (void)setCurrentSelectionState:(id)a3;
- (void)setMultiSelectInteraction:(id)a3;
- (void)setTableView:(id)a3;
- (void)toggleSelectionStateUpToIndexPath:(id)a3;
- (void)uninstallFromTableView;
- (void)willBeginExtendingSelectionAtIndexPath:(id)a3 keepingSelection:(BOOL)a4;
- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 keepCurrentSelection:(BOOL)a5;
@end

@implementation _UITableViewMultiSelectController

- (_UITableViewMultiSelectController)initWithTableView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UITableViewMultiSelectController;
  v5 = [(_UITableViewMultiSelectController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableView, v4);
    v7 = objc_alloc_init(UIMultiSelectInteraction);
    multiSelectInteraction = v6->_multiSelectInteraction;
    v6->_multiSelectInteraction = v7;

    [(UIMultiSelectInteraction *)v6->_multiSelectInteraction setDelegate:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_tableView);
    [WeakRetained addInteraction:v6->_multiSelectInteraction];
  }
  return v6;
}

- (void)uninstallFromTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained removeInteraction:self->_multiSelectInteraction];
}

- (void)selectedIndexPathsChanged:(id)a3
{
  id v4 = a3;
  v5 = [(_UITableViewMultiSelectController *)self currentSelectionState];

  if (v5)
  {
    v6 = [(_UITableViewMultiSelectController *)self currentSelectionState];
    [(UIMultiSelectInteractionState *)v6 updateStateWithDifferenceFromCurrentSelection:v4];
  }
  else
  {
    v6 = [[UIMultiSelectInteractionState alloc] initWithCurrentSelection:v4];

    [(_UITableViewMultiSelectController *)self setCurrentSelectionState:v6];
  }
}

- (void)_handleAutoScrollFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(_UITableViewMultiSelectController *)self tableView];
  id v8 = [v6 _autoScrollAssistant];

  v7 = [(_UITableViewMultiSelectController *)self tableView];
  LODWORD(v6) = [v7 _shouldAutoScroll];

  if (v6) {
    objc_msgSend(v8, "autoScrollFromPoint:", x, y);
  }
  else {
    [v8 stop];
  }
}

- (void)_endAutoScroll
{
  id v3 = [(_UITableViewMultiSelectController *)self tableView];
  v2 = [v3 _autoScrollAssistant];
  [v2 stop];
}

- (void)_selectIndexPaths:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = [(_UITableViewMultiSelectController *)self tableView];
  uint64_t v7 = [v6 indexPathsForSelectedRows];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  v10 = [v4 setWithArray:v9];

  objc_super v11 = (void *)[v5 mutableCopy];
  [v11 minusSet:v10];
  v12 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55___UITableViewMultiSelectController__selectIndexPaths___block_invoke;
  v14[3] = &unk_1E52D9F98;
  id v15 = v11;
  v16 = self;
  id v13 = v11;
  [v12 ignoreSelectionChangedNotificationsWithBlock:v14];
}

- (void)_deselectIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___UITableViewMultiSelectController__deselectIndexPaths___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 ignoreSelectionChangedNotificationsWithBlock:v7];
}

- (void)_updateSelectedIndexPathsForCurrentSelection
{
  id v3 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  id v12 = [v3 startIndexPath];

  id v4 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  id v5 = [v4 endIndexPath];

  if (v12 && v5)
  {
    uint64_t v6 = [v12 section];
    uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithObject:v5];
    uint64_t v8 = [v5 row];
    if (v8 > [v12 row]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
    for (uint64_t i = [v12 row]; i != objc_msgSend(v5, "row"); i += v9)
    {
      objc_super v11 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:v6];
      [v7 addObject:v11];
    }
    [(_UITableViewMultiSelectController *)self _updateSelectedIndexPaths:v7];
  }
}

- (void)_updateSelectedIndexPaths:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(_UITableViewMultiSelectController *)self tableView];
  uint64_t v7 = [v6 indexPathsForSelectedRows];
  uint64_t v8 = [v5 setWithArray:v7];

  uint64_t v9 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  v10 = [v9 pathsToSelectForInterpolatedIndexPaths:v4];

  objc_super v11 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  v22 = (void *)v8;
  v23 = v4;
  id v12 = [v11 pathsToDeselectForInterpolatedIndexPaths:v4 currentlySelectedIndexPaths:v8];

  id v13 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v18);
        v20 = [(_UITableViewMultiSelectController *)self tableView];
        int v21 = [v20 _canRowBeIncludedInMultipleSelection:v19];

        if (v21) {
          [v13 addObject:v19];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  [(_UITableViewMultiSelectController *)self _selectIndexPaths:v14];
  [(_UITableViewMultiSelectController *)self _deselectIndexPaths:v12];
}

- (void)_adjustSelectionRangeToIndexPath:(id)a3 isDeselecting:(BOOL)a4
{
  id v9 = a3;
  id v5 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  uint64_t v6 = [v5 startIndexPath];

  if (v6)
  {
    uint64_t v7 = [v9 section];
    if (v7 == [v6 section])
    {
      uint64_t v8 = [(_UITableViewMultiSelectController *)self currentSelectionState];
      [v8 setEndIndexPath:v9];

      [(_UITableViewMultiSelectController *)self _updateSelectedIndexPathsForCurrentSelection];
    }
  }
}

- (BOOL)_isPointInsideEditControl:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(_UITableViewMultiSelectController *)self tableView];
  uint64_t v7 = objc_msgSend(v6, "indexPathForRowAtPoint:", x, y);

  uint64_t v8 = [(_UITableViewMultiSelectController *)self tableView];
  id v9 = [v8 cellForRowAtIndexPath:v7];

  v10 = [v9 editingData:0];
  objc_super v11 = [v10 editControl:0];

  BOOL v21 = 0;
  if (v11)
  {
    id v12 = [(_UITableViewMultiSelectController *)self tableView];
    objc_msgSend(v11, "convertPoint:fromView:", v12, x, y);
    double v14 = v13;
    double v16 = v15;

    [v11 bounds];
    if (sqrt((v18 + v17 * 0.5 - v14) * (v18 + v17 * 0.5 - v14) + (v20 + v19 * 0.5 - v16) * (v20 + v19 * 0.5 - v16)) < 35.0) {
      BOOL v21 = 1;
    }
  }

  return v21;
}

- (id)_tableViewDelegate
{
  id v3 = [(_UITableViewMultiSelectController *)self tableView];
  id v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(_UITableViewMultiSelectController *)self tableView];
    uint64_t v7 = [v6 delegate];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)clearSelectionState
{
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
  p_tableView = &self->_tableView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  id v19 = [WeakRetained indexPathsForSelectedRows];

  uint64_t v8 = [v19 lastObject];
  id v9 = objc_loadWeakRetained((id *)p_tableView);
  uint64_t v10 = [v9 globalRowForRowAtIndexPath:v8];

  if (a4 == 1) {
    uint64_t v11 = v10 + 1;
  }
  else {
    uint64_t v11 = v10;
  }
  if (a4 == 2) {
    uint64_t v12 = v10 - 1;
  }
  else {
    uint64_t v12 = v11;
  }
  id v13 = objc_loadWeakRetained((id *)p_tableView);
  double v14 = [v13 indexPathForRowAtGlobalRow:v12];

  double v15 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  double v16 = [v15 startIndexPath];

  if (v16)
  {
    uint64_t v17 = [v14 section];
    if (v17 == [v16 section])
    {
      double v18 = [(_UITableViewMultiSelectController *)self currentSelectionState];
      [v18 setEndIndexPath:v14];

      [(_UITableViewMultiSelectController *)self _updateSelectedIndexPathsForCurrentSelection];
    }
  }
}

- (BOOL)isInMultiSelectMode
{
  v2 = [(_UITableViewMultiSelectController *)self tableView];
  if (dyld_program_sdk_at_least()) {
    char v3 = [v2 _allowsEffectiveMultipleSelection];
  }
  else {
    char v3 = [v2 isEditing]
  }
      && ([v2 allowsMultipleSelectionDuringEditing] & 1) != 0;

  return v3;
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(_UITableViewMultiSelectController *)self multiSelectInteraction];
  uint64_t v6 = [v5 activeGestureType];

  if ([(_UITableViewMultiSelectController *)self isInMultiSelectMode])
  {
    if (!dyld_program_sdk_at_least() || (unint64_t)(v6 - 1) > 1) {
      return;
    }
    id v16 = [(_UITableViewMultiSelectController *)self tableView];
    if (([v16 _isEditingWithNoSwipedCell] & 1) == 0)
    {
      uint64_t v7 = [(_UITableViewMultiSelectController *)self tableView];
      int v8 = [v7 allowsMultipleSelectionDuringEditing];

      if (!v8) {
        return;
      }
      id v9 = [(_UITableViewMultiSelectController *)self tableView];
      id v16 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = [(_UITableViewMultiSelectController *)self tableView];
    id v16 = v9;
    if (!v3)
    {
LABEL_10:
      [v9 setEditing:1 animated:1];
      goto LABEL_11;
    }
    uint64_t v10 = [v9 indexPathsForSelectedRows];

    uint64_t v11 = [[UIMultiSelectInteractionState alloc] initWithCurrentSelection:v10];
    [(_UITableViewMultiSelectController *)self setCurrentSelectionState:v11];

    uint64_t v12 = [(_UITableViewMultiSelectController *)self tableView];
    [v12 setEditing:1 animated:1];

    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    id v16 = [(_UITableViewMultiSelectController *)self currentSelectionState];
    double v14 = [v16 originallySelectedIndexPaths];
    double v15 = [v13 setWithArray:v14];
    [(_UITableViewMultiSelectController *)self _selectIndexPaths:v15];
  }
LABEL_11:
}

- (BOOL)_shouldBeginInteractionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v5 = self;
  uint64_t v6 = [(_UITableViewMultiSelectController *)self tableView];
  uint64_t v7 = objc_msgSend(v6, "indexPathForRowAtPoint:", x, y);

  LOBYTE(v5) = [(_UITableViewMultiSelectController *)v5 _shouldBeginInteractionAtIndexPath:v7];
  return (char)v5;
}

- (BOOL)_shouldBeginInteractionAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(_UITableViewMultiSelectController *)self isInMultiSelectMode])
  {
    char v5 = 1;
  }
  else
  {
    if (v4) {
      goto LABEL_5;
    }
    uint64_t v6 = [(_UITableViewMultiSelectController *)self tableView];
    uint64_t v7 = [v6 indexPathsForSelectedRows];
    id v4 = [v7 lastObject];

    if (v4)
    {
LABEL_5:
      int v8 = [(_UITableViewMultiSelectController *)self _tableViewDelegate];
      id v9 = [(_UITableViewMultiSelectController *)self tableView];
      char v5 = [v8 tableView:v9 shouldBeginMultipleSelectionInteractionAtIndexPath:v4];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 keepCurrentSelection:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  if (a4.x == *MEMORY[0x1E4F1DB20] && a4.y == *(double *)(MEMORY[0x1E4F1DB20] + 8))
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v10 = [(_UITableViewMultiSelectController *)self tableView];
    objc_msgSend(v10, "indexPathForRowAtPoint:", x, y);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(_UITableViewMultiSelectController *)self willBeginExtendingSelectionAtIndexPath:v11 keepingSelection:v5];
}

- (void)willBeginExtendingSelectionAtIndexPath:(id)a3 keepingSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(_UITableViewMultiSelectController *)self tableView];
  int v8 = [v7 indexPathsForSelectedRows];

  id v9 = [(_UITableViewMultiSelectController *)self currentSelectionState];

  if (!v9)
  {
    if (v4) {
      uint64_t v10 = [[UIMultiSelectInteractionState alloc] initWithCurrentSelection:v8];
    }
    else {
      uint64_t v10 = objc_alloc_init(UIMultiSelectInteractionState);
    }
    id v11 = v10;
    [(_UITableViewMultiSelectController *)self setCurrentSelectionState:v10];
  }
  uint64_t v12 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  [v12 beginMultiselectInteraction];

  id v13 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  [v13 updateStateWithStartingIndexPath:v6 otherSelectedIndexPaths:v8];

  double v14 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  double v15 = [v14 startIndexPath];

  if (v15)
  {
    id v16 = [(_UITableViewMultiSelectController *)self currentSelectionState];
    id v22 = [v16 startIndexPath];

    uint64_t v17 = [(_UITableViewMultiSelectController *)self tableView];
    double v18 = [v17 delegate];

    if (objc_opt_respondsToSelector())
    {
      id v19 = [(_UITableViewMultiSelectController *)self tableView];
      [v18 tableView:v19 didBeginMultipleSelectionInteractionAtIndexPath:v22];
    }
    double v20 = [(_UITableViewMultiSelectController *)self tableView];
    [v20 _forciblyCancelPendingSelection];

    BOOL v21 = [(_UITableViewMultiSelectController *)self tableView];
    [v21 unhighlightRowAtIndexPath:v22 animated:0];
  }
  else
  {
    id v22 = v6;
  }
}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  BOOL v4 = [(_UITableViewMultiSelectController *)self _tableViewDelegate];
  if (v4)
  {
    BOOL v5 = [(_UITableViewMultiSelectController *)self tableView];
    char v6 = [v5 allowsMultipleSelectionDuringEditing];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 ofType:(int64_t)a4 atPoint:(CGPoint)a5 withVelocity:(CGPoint)a6
{
  double y = a5.y;
  double x = a5.x;
  if (a4)
  {
    LOBYTE(v9) = -[_UITableViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", a3, a5.x, a5.y, a6.x, a6.y);
  }
  else
  {
    BOOL v9 = [(_UITableViewMultiSelectController *)self isInMultiSelectMode];
    if (v9)
    {
      LOBYTE(v9) = -[_UITableViewMultiSelectController _isPointInsideEditControl:](self, "_isPointInsideEditControl:", x, y);
    }
  }
  return v9;
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  [(_UITableViewMultiSelectController *)self _endAutoScroll];
  BOOL v5 = [(_UITableViewMultiSelectController *)self _tableViewDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(_UITableViewMultiSelectController *)self _tableViewDelegate];
    int v8 = [(_UITableViewMultiSelectController *)self tableView];
    [v7 tableViewDidEndMultipleSelectionInteraction:v8];
  }
  id v9 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  [v9 endMultiselectInteraction];
}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = self;
  char v6 = [(_UITableViewMultiSelectController *)self tableView];
  uint64_t v7 = objc_msgSend(v6, "indexPathForRowAtPoint:", x, y);

  LOBYTE(v5) = [(_UITableViewMultiSelectController *)v5 shouldAllowSelectionExtensionAtIndexPath:v7];
  return (char)v5;
}

- (BOOL)shouldAllowSelectionAppendageAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (dyld_program_sdk_at_least())
  {
    return -[_UITableViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", x, y);
  }
  else
  {
    return -[_UITableViewMultiSelectController shouldAllowSelectionExtensionAtPoint:](self, "shouldAllowSelectionExtensionAtPoint:", x, y);
  }
}

- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITableViewMultiSelectController *)self tableView];
  char v6 = [v5 indexPathsForSelectedRows];
  if ([v6 count]) {
    BOOL v7 = [(_UITableViewMultiSelectController *)self _shouldBeginInteractionAtIndexPath:v4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)toggleSelectionStateUpToIndexPath:(id)a3
{
}

- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v7 = [(_UITableViewMultiSelectController *)self tableView];
  objc_msgSend(v7, "_nearestCellToPoint:", x, y);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  int v8 = [(_UITableViewMultiSelectController *)self tableView];
  id v9 = [v8 indexPathForCell:v10];

  [(_UITableViewMultiSelectController *)self toggleSelectionStateUpToIndexPath:v9];
  -[_UITableViewMultiSelectController _handleAutoScrollFromPoint:](self, "_handleAutoScrollFromPoint:", x, y);
}

- (void)multiSelectInteraction:(id)a3 appendSelectionAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v7 = [(_UITableViewMultiSelectController *)self tableView];
  objc_msgSend(v7, "indexPathForRowAtPoint:", x, y);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  int v8 = v13;
  if (v13)
  {
    id v9 = [(_UITableViewMultiSelectController *)self currentSelectionState];
    int v10 = [v9 isSelecting];

    id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
    if (v10) {
      [(_UITableViewMultiSelectController *)self _selectIndexPaths:v11];
    }
    else {
      [(_UITableViewMultiSelectController *)self _deselectIndexPaths:v11];
    }

    uint64_t v12 = [(_UITableViewMultiSelectController *)self currentSelectionState];
    [v12 setStartIndexPath:v13];

    int v8 = v13;
  }
}

- (BOOL)multiSelectInteractionGestureShouldPreventDragLiftGesture:(id)a3
{
  return 1;
}

- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  int v8 = [v7 set];
  [(_UITableViewMultiSelectController *)self _updateSelectedIndexPaths:v8];

  -[_UITableViewMultiSelectController didEndMultiSelectInteraction:atPoint:](self, "didEndMultiSelectInteraction:atPoint:", v9, x, y);
}

- (BOOL)isInMultiselectInteraction
{
  v2 = [(_UITableViewMultiSelectController *)self currentSelectionState];
  char v3 = [v2 isInMultiselectInteraction];

  return v3;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (UIMultiSelectInteraction)multiSelectInteraction
{
  return self->_multiSelectInteraction;
}

- (void)setMultiSelectInteraction:(id)a3
{
}

- (UIMultiSelectInteractionState)currentSelectionState
{
  return self->_currentSelectionState;
}

- (void)setCurrentSelectionState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelectionState, 0);
  objc_storeStrong((id *)&self->_multiSelectInteraction, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end