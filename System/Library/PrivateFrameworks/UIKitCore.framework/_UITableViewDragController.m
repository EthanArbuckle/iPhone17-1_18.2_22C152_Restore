@interface _UITableViewDragController
+ (BOOL)isEnabledByDefault;
- (BOOL)_dragInteractionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3;
- (BOOL)canProvideItemsForDragAtPoint:(CGPoint)a3;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)forceEnabledForReordering;
- (BOOL)isActive;
- (NSIndexPath)draggedIndexPath;
- (NSIndexPath)initiatingIndexPath;
- (NSIndexPath)tentativeInitiatingIndexPath;
- (NSMapTable)cellsAnimatingCancel;
- (NSMutableOrderedSet)indexPaths;
- (NSMutableOrderedSet)tentativeIndexPaths;
- (UIDragInteraction)dragInteraction;
- (UIDragSession)dragSession;
- (UITableViewCell)draggedCell;
- (UITableViewCell)initiatingCell;
- (UITableViewCell)tentativeInitiatingCell;
- (_UITableViewDragController)initWithTableView:(id)a3;
- (_UITableViewDragControllerDelegate)tableView;
- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)clientEnabledState;
- (void)addTentativeRowAtIndexPath:(id)a3;
- (void)beginDragForTentativeRows;
- (void)beginDragOfRowsForSession:(id)a3 notifyDelegate:(BOOL)a4;
- (void)clearTentativeRows;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)forceReset;
- (void)immediatelyBeginDragWithTouch:(id)a3;
- (void)resetDragState;
- (void)setCellsAnimatingCancel:(id)a3;
- (void)setClientEnabledState:(int64_t)a3;
- (void)setDragInteraction:(id)a3;
- (void)setDragSession:(id)a3;
- (void)setForceEnabledForReordering:(BOOL)a3;
- (void)setIndexPaths:(id)a3;
- (void)setInitiatingCell:(id)a3;
- (void)setInitiatingIndexPath:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTentativeIndexPaths:(id)a3;
- (void)setTentativeInitiatingCell:(id)a3;
- (void)setTentativeInitiatingIndexPath:(id)a3;
- (void)setupDragInteraction;
- (void)uninstallFromTableView;
- (void)updateDragInteractionEnabledState;
@end

@implementation _UITableViewDragController

- (_UITableViewDragController)initWithTableView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 60, @"Invalid parameter not satisfying: %@", @"tableView != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)_UITableViewDragController;
  v6 = [(_UITableViewDragController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_tableView, v5);
    uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
    indexPaths = v7->_indexPaths;
    v7->_indexPaths = (NSMutableOrderedSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSet];
    tentativeIndexPaths = v7->_tentativeIndexPaths;
    v7->_tentativeIndexPaths = (NSMutableOrderedSet *)v10;

    v7->_clientEnabledState = 0;
    v7->_forceEnabledForReordering = 0;
    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    cellsAnimatingCancel = v7->_cellsAnimatingCancel;
    v7->_cellsAnimatingCancel = (NSMapTable *)v12;

    [(_UITableViewDragController *)v7 resetDragState];
    [(_UITableViewDragController *)v7 setupDragInteraction];
  }

  return v7;
}

- (void)setupDragInteraction
{
  v4 = [[UIDragInteraction alloc] initWithDelegate:self];
  [(_UITableViewDragController *)self setDragInteraction:v4];
  v3 = [(_UITableViewDragController *)self tableView];
  [v3 addInteraction:v4];
}

- (_UITableViewDragControllerDelegate)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (_UITableViewDragControllerDelegate *)WeakRetained;
}

- (void)setDragInteraction:(id)a3
{
}

- (void)resetDragState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(_UITableViewDragController *)self setInitiatingCell:0];
  [(_UITableViewDragController *)self setInitiatingIndexPath:0];
  [(NSMutableOrderedSet *)self->_indexPaths removeAllObjects];
  v3 = [(_UITableViewDragController *)self dragSession];
  v4 = [(_UITableViewDragController *)self tableView];
  id v5 = v3;
  id v6 = v4;
  if (v5)
  {
    objc_opt_class();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = objc_msgSend(v5, "items", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v13 = [v12 _privateLocalContext];
          if (v13)
          {
            if (objc_opt_isKindOfClass())
            {
              id v14 = [v13 tableView];

              if (v14 == v6) {
                [v12 _setPrivateLocalContext:0];
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)setInitiatingIndexPath:(id)a3
{
}

- (void)setInitiatingCell:(id)a3
{
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)setForceEnabledForReordering:(BOOL)a3
{
  self->_forceEnabledForReordering = a3;
  [(_UITableViewDragController *)self updateDragInteractionEnabledState];
}

- (void)updateDragInteractionEnabledState
{
  BOOL v3 = +[UIDragInteraction isEnabledByDefault];
  if ([(_UITableViewDragController *)self forceEnabledForReordering])
  {
    uint64_t v4 = 1;
  }
  else
  {
    int64_t v5 = [(_UITableViewDragController *)self clientEnabledState];
    unsigned int v6 = v5 == 1 || v3;
    if (v5 == 2) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v6;
    }
  }
  id v7 = [(_UITableViewDragController *)self dragInteraction];
  [v7 setEnabled:v4];
}

- (BOOL)forceEnabledForReordering
{
  return self->_forceEnabledForReordering;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (NSMutableOrderedSet)indexPaths
{
  return self->_indexPaths;
}

+ (BOOL)isEnabledByDefault
{
  return +[UIDragInteraction isEnabledByDefault];
}

- (void)setClientEnabledState:(int64_t)a3
{
  self->_clientEnabledState = a3;
  [(_UITableViewDragController *)self updateDragInteractionEnabledState];
}

- (void)forceReset
{
  BOOL v3 = [(_UITableViewDragController *)self indexPaths];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(_UITableViewDragController *)self resetDragState];
  }
}

- (void)uninstallFromTableView
{
  [(_UITableViewDragController *)self forceReset];
  id v4 = [(_UITableViewDragController *)self tableView];
  BOOL v3 = [(_UITableViewDragController *)self dragInteraction];
  [v4 removeInteraction:v3];
}

- (BOOL)isActive
{
  BOOL v3 = [(_UITableViewDragController *)self indexPaths];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    int64_t v5 = [(_UITableViewDragController *)self dragSession];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (UITableViewCell)draggedCell
{
  BOOL v3 = [(_UITableViewDragController *)self indexPaths];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    int64_t v5 = [(_UITableViewDragController *)self initiatingCell];
  }
  else
  {
    int64_t v5 = 0;
  }
  return (UITableViewCell *)v5;
}

- (NSIndexPath)draggedIndexPath
{
  BOOL v3 = [(_UITableViewDragController *)self indexPaths];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    int64_t v5 = [(_UITableViewDragController *)self initiatingIndexPath];
  }
  else
  {
    int64_t v5 = 0;
  }
  return (NSIndexPath *)v5;
}

- (void)immediatelyBeginDragWithTouch:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITableViewDragController *)self dragInteraction];
  [v5 _immediatelyBeginDragWithTouch:v4 completion:0];
}

- (BOOL)canProvideItemsForDragAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v6 = [(_UITableViewDragController *)self tableView];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__190;
  v35 = __Block_byref_object_dispose__190;
  id v36 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60___UITableViewDragController_canProvideItemsForDragAtPoint___block_invoke;
  v26[3] = &unk_1E52EE808;
  v28 = &v31;
  id v7 = v6;
  id v27 = v7;
  double v29 = x;
  double v30 = y;
  [v7 _performUsingPresentationValues:v26];
  if (v32[5]
    && ([(_UITableViewDragController *)self indexPaths],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsObject:v32[5]],
        v8,
        (v9 & 1) == 0))
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__190;
    v24 = __Block_byref_object_dispose__190;
    id v25 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60___UITableViewDragController_canProvideItemsForDragAtPoint___block_invoke_2;
    v16[3] = &unk_1E52EB218;
    long long v18 = &v20;
    id v11 = v7;
    id v17 = v11;
    v19 = &v31;
    [v11 _performUsingPresentationValues:v16];
    uint64_t v12 = (void *)v21[5];
    if (v12
      && ([v12 isUserInteractionEnabled] & 1) != 0
      && (objc_msgSend(v11, "_canBeginDragAtPoint:indexPath:", v32[5], x, y) & 1) != 0)
    {
      [(_UITableViewDragController *)self setTentativeInitiatingCell:v21[5]];
      [(_UITableViewDragController *)self setTentativeInitiatingIndexPath:v32[5]];
      v13 = [(_UITableViewDragController *)self indexPaths];
      uint64_t v14 = [v13 count];

      if (!v14) {
        [(_UITableViewDragController *)self clearTentativeRows];
      }
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v10;
}

- (void)addTentativeRowAtIndexPath:(id)a3
{
}

- (void)clearTentativeRows
{
}

- (void)beginDragForTentativeRows
{
  id v4 = [(_UITableViewDragController *)self indexPaths];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id v7 = [(_UITableViewDragController *)self initiatingCell];

    if (has_internal_diagnostics)
    {
      if (v7)
      {
        long long v16 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v27 = 0;
          _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "There should not be a cell stored in the initiatingCell property if there are no index paths in the drag.", v27, 2u);
        }
      }
    }
    else if (v7)
    {
      uint64_t v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1248) + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "There should not be a cell stored in the initiatingCell property if there are no index paths in the drag.", buf, 2u);
      }
    }
    int v8 = os_variant_has_internal_diagnostics();
    char v9 = [(_UITableViewDragController *)self initiatingIndexPath];

    if (v8)
    {
      if (v9)
      {
        id v17 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v25 = 0;
          _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "There should not be a cell stored in the initiatingIndexPath property if there are no index paths in the drag.", v25, 2u);
        }
      }
    }
    else if (v9)
    {
      v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2635E0) + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "There should not be a cell stored in the initiatingIndexPath property if there are no index paths in the drag.", v24, 2u);
      }
    }
    BOOL v10 = [(_UITableViewDragController *)self tentativeInitiatingCell];
    uint64_t v11 = [(_UITableViewDragController *)self tentativeInitiatingIndexPath];
    uint64_t v12 = (void *)v11;
    if (v10)
    {
      if (v11)
      {
LABEL_8:
        [(_UITableViewDragController *)self setInitiatingCell:v10];
        [(_UITableViewDragController *)self setInitiatingIndexPath:v12];

        goto LABEL_9;
      }
    }
    else
    {
      long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = NSStringFromSelector(a2);
      [v18 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 235, @"_UITableViewDragController internal inconsistency: initiatingCell cannot be nil in %@", v19 object file lineNumber description];

      if (v12) {
        goto LABEL_8;
      }
    }
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = NSStringFromSelector(a2);
    [v20 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 236, @"_UITableViewDragController internal inconsistency: initiatingIndexPath cannot be nil in %@", v21 object file lineNumber description];

    goto LABEL_8;
  }
LABEL_9:
  v13 = [(_UITableViewDragController *)self tentativeIndexPaths];
  if (![v13 count])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 241, @"_UITableViewDragController internal inconsistency: tentativeIndexPaths cannot be empty in %@", v15 object file lineNumber description];
  }
  [(NSMutableOrderedSet *)self->_indexPaths unionOrderedSet:v13];
  [(_UITableViewDragController *)self setTentativeInitiatingCell:0];
  [(_UITableViewDragController *)self setTentativeInitiatingIndexPath:0];
  [(_UITableViewDragController *)self clearTentativeRows];
}

- (void)beginDragOfRowsForSession:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  [(_UITableViewDragController *)self beginDragForTentativeRows];
  unsigned int v6 = [(_UITableViewDragController *)self tableView];
  id v7 = v6;
  if (v4) {
    [v6 _dragSessionWillBegin:v8];
  }
  [v7 _updateAppearanceOfVisibleRowsForDragState];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(_UITableViewDragController *)self tableView];
  v32 = v6;
  [v6 locationInView:v7];
  if (-[_UITableViewDragController canProvideItemsForDragAtPoint:](self, "canProvideItemsForDragAtPoint:"))
  {
    uint64_t v8 = [(_UITableViewDragController *)self tentativeInitiatingIndexPath];
    if (!v8)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = NSStringFromSelector(a2);
      [v23 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 284, @"_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@", v24 object file lineNumber description];
    }
    char v9 = objc_msgSend(v7, "_rowsToIncludeInDragSession:atIndexPath:withDataOwner:", v6, v8, objc_msgSend(v7, "_dataOwnerForDragSession:atIndexPath:", v6, v8));
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    char v11 = [v9 containsObject:v8];
    id v27 = (void *)v8;
    if (has_internal_diagnostics)
    {
      if ((v11 & 1) == 0)
      {
        id v25 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "The rows to include in the drag should always contain the index path that initiated the drag.", buf, 2u);
        }
      }
    }
    else if ((v11 & 1) == 0)
    {
      v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dragInteraction_itemsForBeginningSession____s_category)+ 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "The rows to include in the drag should always contain the index path that initiated the drag.", buf, 2u);
      }
    }
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v9;
    uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v33)
    {
      uint64_t v31 = *(void *)v40;
      double v29 = self;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v14 = [v7 _itemsForBeginningDragSession:v32 atIndexPath:v13];
          if ([v14 count])
          {
            [(_UITableViewDragController *)self addTentativeRowAtIndexPath:v13];
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            v34 = v14;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v36;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v36 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  v21 = [[_UITableViewDragItemContext alloc] initWithIndexPath:v13 forTableView:v7];
                  [v20 _setPrivateLocalContext:v21];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
              }
              while (v17);
            }

            [v30 addObjectsFromArray:v15];
            self = v29;
            uint64_t v14 = v34;
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v33);
    }
  }
  else
  {
    id v30 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (-[_UITableViewDragController canProvideItemsForDragAtPoint:](self, "canProvideItemsForDragAtPoint:", x, y))
  {
    BOOL v10 = [(_UITableViewDragController *)self tentativeInitiatingIndexPath];
    if (!v10)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = NSStringFromSelector(a2);
      [v21 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 317, @"_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@", v22 object file lineNumber description];
    }
    char v11 = [(_UITableViewDragController *)self tableView];
    uint64_t v12 = objc_msgSend(v11, "_itemsForAddingToDragSession:atIndexPath:point:withDataOwner:", v9, v10, objc_msgSend(v9, "_dataOwner"), x, y);
    if ([v12 count])
    {
      id v23 = v9;
      [(_UITableViewDragController *)self addTentativeRowAtIndexPath:v10];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v19 = [[_UITableViewDragItemContext alloc] initWithIndexPath:v10 forTableView:v11];
            [v18 _setPrivateLocalContext:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }

      id v9 = v23;
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 _privateLocalContext];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v30 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v31 = NSStringFromSelector(a2);
      [v30 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 337, @"UITableView internal inconsistency: %@ should never be called for a drag item that did not come from this table view", v31 object file lineNumber description];
    }
  }
  id v13 = [v12 indexPath];
  if (v13)
  {
    uint64_t v14 = [(_UITableViewDragController *)self tableView];
    uint64_t v36 = 0;
    long long v37 = &v36;
    uint64_t v38 = 0x3032000000;
    long long v39 = __Block_byref_object_copy__190;
    long long v40 = __Block_byref_object_dispose__190;
    id v41 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __76___UITableViewDragController_dragInteraction_previewForLiftingItem_session___block_invoke;
    v32[3] = &unk_1E52E1B98;
    long long v35 = &v36;
    id v15 = v14;
    id v33 = v15;
    id v16 = v13;
    id v34 = v16;
    [v15 _performUsingPresentationValues:v32];
    uint64_t v17 = (void *)v37[5];
    if (v17 && ([v17 window], uint64_t v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
    {
      v19 = [(id)v37[5] _dropAnimationContainerView];

      if (v19)
      {
        uint64_t v20 = [UIDragPreviewTarget alloc];
        v21 = [(id)v37[5] superview];
        [(id)v37[5] center];
        objc_msgSend(v21, "convertPoint:toView:", v15);
        v19 = -[UIPreviewTarget initWithContainer:center:](v20, "initWithContainer:center:", v15);
      }
      uint64_t v22 = [v15 _dragPreviewParametersForIndexPath:v16];
      id v23 = v22;
      if (v22) {
        id v24 = v22;
      }
      else {
        id v24 = (id)objc_opt_new();
      }
      long long v26 = v24;

      long long v27 = [UITargetedDragPreview alloc];
      if (v19) {
        uint64_t v28 = [(UITargetedDragPreview *)v27 initWithView:v37[5] parameters:v26 target:v19];
      }
      else {
        uint64_t v28 = [(UITargetedPreview *)v27 initWithView:v37[5] parameters:v26];
      }
      long long v25 = (void *)v28;
    }
    else
    {
      long long v25 = 0;
    }

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7 = a4;
  uint64_t v8 = [(_UITableViewDragController *)self tentativeIndexPaths];
  id v9 = (void *)[v8 copy];

  if (![v9 count])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 377, @"_UITableViewDragController internal inconsistency: tentativeIndexPaths cannot be empty in %@", v15 object file lineNumber description];
  }
  id v10 = [(_UITableViewDragController *)self tableView];
  [v10 _prepareToLiftRowsAtIndexPaths:v9];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82___UITableViewDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v18[3] = &unk_1E52D9F98;
  id v11 = v10;
  id v19 = v11;
  id v20 = v9;
  id v12 = v9;
  [v7 addAnimations:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82___UITableViewDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v16[3] = &unk_1E52DC698;
  id v17 = v11;
  id v13 = v11;
  [v7 addCompletion:v16];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a4;
  [(_UITableViewDragController *)self setDragSession:v5];
  [(_UITableViewDragController *)self beginDragOfRowsForSession:v5 notifyDelegate:1];
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v6 = a4;
  [(_UITableViewDragController *)self resetDragState];
  id v7 = [(_UITableViewDragController *)self tableView];
  [(_UITableViewDragController *)self setDragSession:0];
  [v7 _dragSessionDidEnd:v6];

  [v7 _updateAppearanceOfVisibleRowsForDragState];
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v6 = a4;
  id v7 = [(_UITableViewDragController *)self dragSession];
  if (v7)
  {
    if ([v6 containsObject:v7])
    {
      id v8 = v7;
LABEL_9:
      id v10 = v8;
      goto LABEL_11;
    }
    if (os_variant_has_internal_diagnostics())
    {
      id v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "It should not be possible for mySession to not be one of the localDragSessions", buf, 2u);
      }
    }
    else
    {
      id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dragInteraction_sessionForAddingItems_withTouchAtPoint____s_category)+ 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "It should not be possible for mySession to not be one of the localDragSessions", v13, 2u);
      }
    }
  }
  if ([v6 count] == 1)
  {
    id v8 = [v6 firstObject];
    goto LABEL_9;
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v9 = a4;
  if (a3 == a6)
  {
    id v11 = v9;
    id v10 = [(_UITableViewDragController *)self dragSession];

    if (!v10) {
      [(_UITableViewDragController *)self setDragSession:v11];
    }
    [(_UITableViewDragController *)self beginDragOfRowsForSession:v11 notifyDelegate:v10 == 0];
    id v9 = v11;
  }
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 _privateLocalContext];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v26 = NSStringFromSelector(a2);
      [v25 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 456, @"UITableView internal inconsistency: %@ should never be called for a drag item that did not come from this table view", v26 object file lineNumber description];
    }
  }
  id v13 = [v12 indexPath];
  if (v13)
  {
    uint64_t v14 = [(_UITableViewDragController *)self tableView];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    id v34 = __Block_byref_object_copy__190;
    long long v35 = __Block_byref_object_dispose__190;
    id v36 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __83___UITableViewDragController_dragInteraction_previewForCancellingItem_withDefault___block_invoke;
    v27[3] = &unk_1E52E1B98;
    id v30 = &v31;
    id v15 = v14;
    id v28 = v15;
    id v16 = v13;
    id v29 = v16;
    [v15 _performUsingPresentationValues:v27];
    id v17 = (void *)v32[5];
    if (v17 && ([v17 window], uint64_t v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
    {
      id v19 = [(_UITableViewDragController *)self cellsAnimatingCancel];
      [v19 setObject:v32[5] forKey:v10];

      id v20 = [v15 _beginAnimatingDropOfCell:v32[5] isCanceling:1];
      v21 = [v15 _dragPreviewParametersForIndexPath:v16];
      if (v21) {
        uint64_t v22 = [(UITargetedPreview *)[UITargetedDragPreview alloc] initWithView:v20 parameters:v21];
      }
      else {
        uint64_t v22 = [[UITargetedDragPreview alloc] initWithView:v20];
      }
      id v23 = v22;
    }
    else
    {
      id v23 = 0;
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_UITableViewDragController *)self cellsAnimatingCancel];
  id v12 = [v11 objectForKey:v9];

  if (v12)
  {
    id v13 = [(_UITableViewDragController *)self tableView];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81___UITableViewDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
    v23[3] = &unk_1E52D9F98;
    id v14 = v13;
    id v24 = v14;
    id v15 = v12;
    id v25 = v15;
    [v10 addAnimations:v23];
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81___UITableViewDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke_2;
    v17[3] = &unk_1E5308AD0;
    objc_copyWeak(&v21, &location);
    id v16 = v14;
    id v18 = v16;
    id v19 = v15;
    id v20 = v9;
    [v10 addCompletion:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  id v5 = a4;
  id v6 = [(_UITableViewDragController *)self tableView];
  char v7 = [v6 _dragSessionAllowsMoveOperation:v5];

  return v7;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5 = a4;
  id v6 = [(_UITableViewDragController *)self tableView];
  char v7 = [v6 _dragSessionIsRestrictedToDraggingApplication:v5];

  return v7;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UITableViewDragController *)self tableView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v5 locationInView:v6];
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.double x = v8;
  v21.origin.double y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v20.double x = v16;
  v20.double y = v18;
  LOBYTE(v5) = CGRectContainsPoint(v21, v20);

  return (char)v5;
}

- (BOOL)_dragInteractionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  return 1;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v6 = a4;
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp())
  {
    double v7 = [(_UITableViewDragController *)self tentativeInitiatingIndexPath];
    if (!v7)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v12 = NSStringFromSelector(a2);
      [v11 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 531, @"_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@", v12 object file lineNumber description];
    }
    CGFloat v8 = [(_UITableViewDragController *)self tableView];
    int64_t v9 = [v8 _dataOwnerForDragSession:v6 atIndexPath:v7];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp()
    && -[_UITableViewDragController canProvideItemsForDragAtPoint:](self, "canProvideItemsForDragAtPoint:", x, y))
  {
    CGFloat v10 = [(_UITableViewDragController *)self tentativeInitiatingIndexPath];
    if (!v10)
    {
      CGFloat v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = NSStringFromSelector(a2);
      [v14 handleFailureInMethod:a2, self, @"_UITableViewDragController.m", 545, @"_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@", v15 object file lineNumber description];
    }
    double v11 = [(_UITableViewDragController *)self tableView];
    int64_t v12 = [v11 _dataOwnerForDragSession:v9 atIndexPath:v10];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UITableViewDragController *)self tableView];
  double v7 = [v6 _dragSessionPropertiesForSession:v5];

  return v7;
}

- (int64_t)clientEnabledState
{
  return self->_clientEnabledState;
}

- (void)setDragSession:(id)a3
{
}

- (void)setIndexPaths:(id)a3
{
}

- (void)setTableView:(id)a3
{
}

- (UITableViewCell)initiatingCell
{
  return self->_initiatingCell;
}

- (NSIndexPath)initiatingIndexPath
{
  return self->_initiatingIndexPath;
}

- (UITableViewCell)tentativeInitiatingCell
{
  return self->_tentativeInitiatingCell;
}

- (void)setTentativeInitiatingCell:(id)a3
{
}

- (NSIndexPath)tentativeInitiatingIndexPath
{
  return self->_tentativeInitiatingIndexPath;
}

- (void)setTentativeInitiatingIndexPath:(id)a3
{
}

- (NSMutableOrderedSet)tentativeIndexPaths
{
  return self->_tentativeIndexPaths;
}

- (void)setTentativeIndexPaths:(id)a3
{
}

- (NSMapTable)cellsAnimatingCancel
{
  return self->_cellsAnimatingCancel;
}

- (void)setCellsAnimatingCancel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellsAnimatingCancel, 0);
  objc_storeStrong((id *)&self->_tentativeIndexPaths, 0);
  objc_storeStrong((id *)&self->_tentativeInitiatingIndexPath, 0);
  objc_storeStrong((id *)&self->_tentativeInitiatingCell, 0);
  objc_storeStrong((id *)&self->_initiatingIndexPath, 0);
  objc_storeStrong((id *)&self->_initiatingCell, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
  objc_storeStrong((id *)&self->_dragSession, 0);
}

@end