@interface _UIFloatingTabBarDragController
- (BOOL)_shouldAddPlaceholderForPendingDrop;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)hasActiveDrag;
- (BOOL)isEditing;
- (BOOL)pendingDropTabHasValidTarget;
- (NSMutableOrderedSet)pendingFavoriteOrder;
- (NSMutableSet)pendingExcludedItems;
- (UIDragInteraction)dragInteraction;
- (UIDragItem)activeDropItem;
- (UIDropInteraction)dropInteraction;
- (UIDropSession)activeDropSession;
- (UITab)currentDragTab;
- (UITab)pendingDropTab;
- (_UIFloatingTabBarDragController)initWithDelegate:(id)a3 view:(id)a4;
- (_UIFloatingTabBarDragControllerDelegate)delegate;
- (double)_dragInteraction:(id)a3 delayForLiftBeginningAtLocation:(CGPoint)a4;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)excludedItems;
- (int64_t)currentDragTabOriginalIndex;
- (void)_insertPlaceholderAtIndex:(int64_t)a3;
- (void)_removePlaceholder;
- (void)_updateFavoriteOrderAnimated:(BOOL)a3;
- (void)beginEditingWithFavoriteOrder:(id)a3 excludedItems:(id)a4;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)endEditing;
- (void)insertTabForIdentifier:(id)a3;
- (void)removeTabForIdentifier:(id)a3;
- (void)resetFavoriteOrderWithDefaultOrder:(id)a3;
- (void)setActiveDropSession:(id)a3;
- (void)setCurrentDragTab:(id)a3;
- (void)setCurrentDragTabOriginalIndex:(int64_t)a3;
- (void)setPendingDropTab:(id)a3;
- (void)setPendingDropTabHasValidTarget:(BOOL)a3;
- (void)setPendingExcludedItems:(id)a3;
- (void)setPendingFavoriteOrder:(id)a3;
@end

@implementation _UIFloatingTabBarDragController

- (_UIFloatingTabBarDragController)initWithDelegate:(id)a3 view:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIFloatingTabBarDragController;
  v8 = [(_UIFloatingTabBarDragController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = [[UIDragInteraction alloc] initWithDelegate:v9];
    dragInteraction = v9->_dragInteraction;
    v9->_dragInteraction = v10;

    [v7 addInteraction:v9->_dragInteraction];
    v12 = [[UIDropInteraction alloc] initWithDelegate:v9];
    dropInteraction = v9->_dropInteraction;
    v9->_dropInteraction = v12;

    [v7 addInteraction:v9->_dropInteraction];
  }

  return v9;
}

- (void)beginEditingWithFavoriteOrder:(id)a3 excludedItems:(id)a4
{
  self->_editing = 1;
  id v6 = (void *)MEMORY[0x1E4F1CA70];
  id v7 = a4;
  v8 = [v6 orderedSetWithOrderedSet:a3];
  pendingFavoriteOrder = self->_pendingFavoriteOrder;
  self->_pendingFavoriteOrder = v8;

  v10 = [MEMORY[0x1E4F1CA80] setWithSet:v7];

  pendingExcludedItems = self->_pendingExcludedItems;
  self->_pendingExcludedItems = v10;
}

- (void)resetFavoriteOrderWithDefaultOrder:(id)a3
{
  v4 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:a3];
  pendingFavoriteOrder = self->_pendingFavoriteOrder;
  self->_pendingFavoriteOrder = v4;

  id v6 = [MEMORY[0x1E4F1CA80] set];
  pendingExcludedItems = self->_pendingExcludedItems;
  self->_pendingExcludedItems = v6;

  [(UIDragInteraction *)self->_dragInteraction setEnabled:0];
  dragInteraction = self->_dragInteraction;
  [(UIDragInteraction *)dragInteraction setEnabled:1];
}

- (void)endEditing
{
  self->_editing = 0;
  pendingFavoriteOrder = self->_pendingFavoriteOrder;
  self->_pendingFavoriteOrder = 0;

  pendingExcludedItems = self->_pendingExcludedItems;
  self->_pendingExcludedItems = 0;

  [(_UIFloatingTabBarDragController *)self _removePlaceholder];
}

- (void)insertTabForIdentifier:(id)a3
{
  id v5 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_pendingFavoriteOrder, "containsObject:") & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_pendingFavoriteOrder addObject:v5];
    v4 = [(_UIFloatingTabBarDragController *)self delegate];
    [v4 tabDragController:self updateFavoriteOrderAnimated:1];
  }
}

- (void)removeTabForIdentifier:(id)a3
{
  id v5 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_pendingFavoriteOrder, "containsObject:"))
  {
    [(NSMutableOrderedSet *)self->_pendingFavoriteOrder removeObject:v5];
    v4 = [(_UIFloatingTabBarDragController *)self delegate];
    [v4 tabDragController:self updateFavoriteOrderAnimated:1];
  }
}

- (BOOL)hasActiveDrag
{
  v2 = [(_UIFloatingTabBarDragController *)self currentDragTab];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)excludedItems
{
  return self->_pendingExcludedItems;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a4;
  if ([(_UIFloatingTabBarDragController *)self isEditing])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = [(_UIFloatingTabBarDragController *)self delegate];
    v8 = [v7 tabDragController:self tabForBeginningSession:v5];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28D78]);
      v10 = [[UIDragItem alloc] initWithItemProvider:v9];
      [(UIDragItem *)v10 setLocalObject:v8];
      [v6 addObject:v10];
      [(_UIFloatingTabBarDragController *)self setCurrentDragTab:v8];
      v11 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
      v12 = [v8 identifier];
      -[_UIFloatingTabBarDragController setCurrentDragTabOriginalIndex:](self, "setCurrentDragTabOriginalIndex:", [v11 indexOfObject:v12]);
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_1E52DC698;
  v5[4] = self;
  [a4 addCompletion:v5];
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = objc_msgSend(a4, "localObject", a3);
  id v7 = [(_UIFloatingTabBarDragController *)self delegate];
  v8 = [v7 tabDragController:self previewForLiftingTab:v6];

  return v8;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6 = objc_msgSend(a4, "localObject", a3);
  id v7 = [(_UIFloatingTabBarDragController *)self currentDragTab];
  if (v6 != v7)
  {

LABEL_4:
    id v9 = [(_UIFloatingTabBarDragController *)self delegate];
    v10 = [v9 tabDragController:self previewForCancellingTab:v6];

    goto LABEL_6;
  }
  uint64_t v8 = [v6 _tabPlacement];

  if (v8 == 3) {
    goto LABEL_4;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v7 = [(_UIFloatingTabBarDragController *)self currentDragTab];
  uint64_t v8 = [v7 _tabPlacement];

  if (!a5 && v8 == 3)
  {
    id v9 = [(_UIFloatingTabBarDragController *)self currentDragTab];
    id v12 = [v9 identifier];

    v10 = [(_UIFloatingTabBarDragController *)self pendingExcludedItems];
    [v10 removeObject:v12];

    v11 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
    objc_msgSend(v11, "insertObject:atIndex:", v12, -[_UIFloatingTabBarDragController currentDragTabOriginalIndex](self, "currentDragTabOriginalIndex"));

    [(_UIFloatingTabBarDragController *)self _updateFavoriteOrderAnimated:1];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (double)_dragInteraction:(id)a3 delayForLiftBeginningAtLocation:(CGPoint)a4
{
  v4 = [(_UIFloatingTabBarDragController *)self delegate];
  id v5 = [v4 collectionView];

  id v6 = [v5 pages];
  unint64_t v7 = [v6 count];

  if (v7 <= 1) {
    double v8 = 0.0;
  }
  else {
    double v8 = 0.15;
  }

  return v8;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  if ([(_UIFloatingTabBarDragController *)self isEditing])
  {
    id v6 = [v5 items];
    unint64_t v7 = [v6 firstObject];
    double v8 = [v7 localObject];

    id v9 = [v5 items];
    if ([v9 count] == 1)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        char v11 = 0;
        goto LABEL_9;
      }
      id v9 = [(_UIFloatingTabBarDragController *)self delegate];
      char v11 = [v9 tabDragController:self canHandleDropSessionForTab:v8];
    }
    else
    {
      char v11 = 0;
    }

LABEL_9:
    goto LABEL_10;
  }
  char v11 = 1;
LABEL_10:

  return v11;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id obj = a4;
  if ([(_UIFloatingTabBarDragController *)self isEditing])
  {
    objc_storeWeak((id *)&self->_activeDropSession, obj);
    id v5 = [obj items];
    id v6 = [v5 firstObject];
    unint64_t v7 = [v6 localObject];

    [(_UIFloatingTabBarDragController *)self setPendingDropTab:v7];
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIFloatingTabBarDragController *)self delegate];
  unint64_t v7 = [v6 tabDragController:self dropProposalForSession:v5];

  double v8 = [(_UIFloatingTabBarDragController *)self delegate];
  id v9 = [v8 tabDragController:self destinationIndexPathForDropSession:v5];

  if (-[_UIFloatingTabBarDragController isEditing](self, "isEditing") && [v7 operation] == 3)
  {
    [(_UIFloatingTabBarDragController *)self setPendingDropTabHasValidTarget:1];
    if ([(_UIFloatingTabBarDragController *)self _shouldAddPlaceholderForPendingDrop])
    {
      if (v9)
      {
        uint64_t v10 = [v9 item];
      }
      else
      {
        id v12 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
        uint64_t v10 = [v12 count];
      }
      [(_UIFloatingTabBarDragController *)self _insertPlaceholderAtIndex:v10];
    }
  }
  else
  {
    [(_UIFloatingTabBarDragController *)self setPendingDropTabHasValidTarget:0];
    [(_UIFloatingTabBarDragController *)self _removePlaceholder];
  }

  return v7;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v11 = a4;
  BOOL v5 = [(_UIFloatingTabBarDragController *)self isEditing];
  id v6 = v11;
  if (v5)
  {
    unint64_t v7 = [v11 items];
    double v8 = [v7 firstObject];
    id v9 = [v8 localObject];

    uint64_t v10 = [(_UIFloatingTabBarDragController *)self pendingDropTab];

    if (v9 == v10)
    {
      [(_UIFloatingTabBarDragController *)self _removePlaceholder];
      [(_UIFloatingTabBarDragController *)self setPendingDropTab:0];
    }

    id v6 = v11;
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  p_activeDropSession = &self->_activeDropSession;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeDropSession);

  if (WeakRetained == v6)
  {
    [(_UIFloatingTabBarDragController *)self setPendingDropTab:0];
    [(_UIFloatingTabBarDragController *)self setPendingDropTabHasValidTarget:0];
    objc_storeWeak((id *)p_activeDropSession, 0);
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(_UIFloatingTabBarDragController *)self isEditing];
  unint64_t v7 = [(_UIFloatingTabBarDragController *)self delegate];
  double v8 = v7;
  if (v6)
  {
    id v21 = [v7 tabDragController:self destinationIndexPathForDropSession:v5];

    id v9 = [v5 items];

    uint64_t v10 = [v9 firstObject];
    id v5 = [v10 localObject];

    id v11 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
    id v12 = [v5 identifier];
    uint64_t v13 = [v11 indexOfObject:v12];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
      [v14 removeObjectAtIndex:v13];
    }
    if (v21)
    {
      uint64_t v15 = [v21 item];
    }
    else
    {
      v16 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
      uint64_t v15 = [v16 count];
    }
    v17 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
    v18 = [v5 identifier];
    [v17 insertObject:v18 atIndex:v15];

    v19 = [(_UIFloatingTabBarDragController *)self pendingExcludedItems];
    v20 = [v5 identifier];
    [v19 removeObject:v20];

    [(_UIFloatingTabBarDragController *)self setPendingDropTab:0];
  }
  else
  {
    [v7 tabDragController:self acceptItemsIntoTabFromDropSession:v5];
    id v21 = v8;
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a4;
  if ([(_UIFloatingTabBarDragController *)self isEditing]
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDropItem),
        WeakRetained,
        WeakRetained == v6))
  {
    id v9 = [v6 localObject];
    uint64_t v10 = [(_UIFloatingTabBarDragController *)self delegate];
    double v8 = [v10 tabDragController:self previewForInsertingTab:v9];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(_UIFloatingTabBarDragController *)self isEditing])
  {
    objc_storeWeak((id *)&self->_activeDropItem, v9);
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84___UIFloatingTabBarDragController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v11[3] = &unk_1E52DC6C0;
    objc_copyWeak(&v12, &location);
    [v10 addCompletion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)setPendingDropTab:(id)a3
{
  id v5 = (UITab *)a3;
  if (self->_pendingDropTab != v5)
  {
    unint64_t v7 = v5;
    objc_storeStrong((id *)&self->_pendingDropTab, a3);
    id v6 = [(_UIFloatingTabBarDragController *)self delegate];
    [v6 tabDragController:self pendingDropTabDidChange:v7];

    id v5 = v7;
    if (!v7)
    {
      [(_UIFloatingTabBarDragController *)self _removePlaceholder];
      id v5 = 0;
    }
  }
}

- (BOOL)_shouldAddPlaceholderForPendingDrop
{
  BOOL v3 = [(_UIFloatingTabBarDragController *)self pendingDropTab];
  if (v3 && [(_UIFloatingTabBarDragController *)self pendingDropTabHasValidTarget])
  {
    v4 = [(_UIFloatingTabBarDragController *)self delegate];
    id v5 = [(_UIFloatingTabBarDragController *)self pendingDropTab];
    int v6 = [v4 tabDragController:self isDisplayingTab:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_insertPlaceholderAtIndex:(int64_t)a3
{
  id v5 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
  int64_t v6 = [v5 indexOfObject:@"com.apple.UIKit.TabBar.Placeholder"];

  unint64_t v7 = [(_UIFloatingTabBarDragController *)self pendingDropTab];

  if (v7)
  {
    id v8 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
    id v9 = [(_UIFloatingTabBarDragController *)self pendingDropTab];
    id v10 = [v9 identifier];
    unint64_t v11 = [v8 indexOfObject:v10];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < a3) {
      ++a3;
    }
  }
  if (v6 != a3)
  {
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 -= v6 < a3;
      if (v6 == a3) {
        return;
      }
      uint64_t v13 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
      [v13 removeObjectAtIndex:v6];
    }
    v14 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
    [v14 insertObject:@"com.apple.UIKit.TabBar.Placeholder" atIndex:a3];

    [(_UIFloatingTabBarDragController *)self _updateFavoriteOrderAnimated:1];
  }
}

- (void)_removePlaceholder
{
  BOOL v3 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
  int v4 = [v3 containsObject:@"com.apple.UIKit.TabBar.Placeholder"];

  if (v4)
  {
    id v5 = [(_UIFloatingTabBarDragController *)self pendingFavoriteOrder];
    [v5 removeObject:@"com.apple.UIKit.TabBar.Placeholder"];

    [(_UIFloatingTabBarDragController *)self _updateFavoriteOrderAnimated:1];
  }
}

- (void)_updateFavoriteOrderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIFloatingTabBarDragController *)self delegate];
  [v5 tabDragController:self updateFavoriteOrderAnimated:v3];

  self->_needsFavoriteOrderUpdate = 0;
}

- (_UIFloatingTabBarDragControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIFloatingTabBarDragControllerDelegate *)WeakRetained;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UITab)pendingDropTab
{
  return self->_pendingDropTab;
}

- (UIDragItem)activeDropItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDropItem);
  return (UIDragItem *)WeakRetained;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (UITab)currentDragTab
{
  return self->_currentDragTab;
}

- (void)setCurrentDragTab:(id)a3
{
}

- (int64_t)currentDragTabOriginalIndex
{
  return self->_currentDragTabOriginalIndex;
}

- (void)setCurrentDragTabOriginalIndex:(int64_t)a3
{
  self->_currentDragTabOriginalIndex = a3;
}

- (UIDropSession)activeDropSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDropSession);
  return (UIDropSession *)WeakRetained;
}

- (void)setActiveDropSession:(id)a3
{
}

- (BOOL)pendingDropTabHasValidTarget
{
  return self->_pendingDropTabHasValidTarget;
}

- (void)setPendingDropTabHasValidTarget:(BOOL)a3
{
  self->_pendingDropTabHasValidTarget = a3;
}

- (NSMutableOrderedSet)pendingFavoriteOrder
{
  return self->_pendingFavoriteOrder;
}

- (void)setPendingFavoriteOrder:(id)a3
{
}

- (NSMutableSet)pendingExcludedItems
{
  return self->_pendingExcludedItems;
}

- (void)setPendingExcludedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingExcludedItems, 0);
  objc_storeStrong((id *)&self->_pendingFavoriteOrder, 0);
  objc_destroyWeak((id *)&self->_activeDropSession);
  objc_storeStrong((id *)&self->_currentDragTab, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_activeDropItem);
  objc_storeStrong((id *)&self->_pendingDropTab, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end