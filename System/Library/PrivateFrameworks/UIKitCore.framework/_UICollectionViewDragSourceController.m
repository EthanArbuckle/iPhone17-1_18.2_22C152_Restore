@interface _UICollectionViewDragSourceController
- (BOOL)_delegateImplementsDragItemsForItemAtIndexPath;
- (BOOL)_delegateImplementsDragItemsForItemAtIndexPathWithDefaultPreview;
- (BOOL)_delegateImplementsDragSourceDidAddItem;
- (BOOL)_delegateImplementsDragSourceItemsAtIndexPath;
- (BOOL)_delegateImplementsSelector:(SEL)a3;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)dragItemsCreatedForReordering;
- (BOOL)isActive;
- (NSString)description;
- (_UICollectionViewDragSourceController)initWithCollectionView:(id)a3 delegate:(id)a4;
- (id)_dragDelegateActual;
- (id)_dragDelegateProxy;
- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4;
- (id)_dragSourceDelegateActual;
- (id)_dragSourceDelegateProxy;
- (id)_filterCandidateIndexPaths:(id)a3 forUserSelectedIndexPath:(id)a4 session:(id)a5;
- (id)_previewParametersForItemAtIndexPath:(id)a3;
- (id)_queryForItemsFromClientForSession:(id)a3 dataSourceIndexPath:(id)a4 location:(CGPoint)a5 isInitialQuery:(BOOL)a6;
- (id)dragFromIndexPath;
- (id)dragFromIndexPaths;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragSession;
- (id)indexPathForDragItem:(id *)a1;
- (int64_t)_dataOwnerForDragSession:(id)a3 atIndexPath:(id)a4;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (uint64_t)currentSessionItemCount;
- (void)_addDragItemsToExistingSession:(id)a3 forDataSourceIndexPath:(id)a4;
- (void)_configureInteraction;
- (void)_sessionWillBegin:(id)a3 forDragInteraction:(id)a4;
- (void)attemptToBeginDragImmediatelyWithTouch:(uint64_t)a1;
- (void)deactivate;
- (void)dealloc;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dragState;
- (void)rebaseForUpdates:(void *)a1;
- (void)sessionState;
- (void)setDragInteractionEnabled:(uint64_t)a1;
- (void)setDragState:(uint64_t)a1;
- (void)setSessionState:(uint64_t)a1;
@end

@implementation _UICollectionViewDragSourceController

- (BOOL)isActive
{
  if (!a1) {
    return 0;
  }
  v1 = -[_UICollectionViewDragSourceController sessionState](a1);
  if (v1) {
    BOOL v2 = v1[1] != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (void)sessionState
{
  if (a1)
  {
    BOOL v2 = a1;
    v3 = (void *)a1[4];
    if (!v3)
    {
      v4 = objc_alloc_init(_UICollectionViewDragSourceControllerSessionState);
      v5 = (void *)v2[4];
      v2[4] = v4;

      v3 = (void *)v2[4];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (_UICollectionViewDragSourceController)initWithCollectionView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewDragSourceController;
  v8 = [(_UICollectionViewDragSourceController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    [(_UICollectionViewDragSourceController *)v9 _configureInteraction];
  }

  return v9;
}

- (void)_configureInteraction
{
  obj = [[UIDragInteraction alloc] initWithDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  [WeakRetained addInteraction:obj];

  if (self) {
    objc_storeWeak((id *)&self->_dragInteraction, obj);
  }
}

- (void)setDragInteractionEnabled:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained setEnabled:a2];
  }
}

- (void)dealloc
{
  -[_UICollectionViewDragSourceController deactivate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewDragSourceController;
  [(_UICollectionViewDragSourceController *)&v3 dealloc];
}

- (void)deactivate
{
  if (a1)
  {
    BOOL v2 = (id *)(a1 + 16);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 8));
      id v5 = objc_loadWeakRetained(v2);
      [v4 removeInteraction:v5];

      objc_storeWeak(v2, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragState, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dragInteraction);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = -[_UICollectionViewDragSourceController sessionState](self);
  v8 = -[_UICollectionViewDragSourceController dragState](self);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; cv = %p; sessionState = %@; dragState = %@>",
    v5,
    self,
    WeakRetained,
    v7,
  v9 = v8);

  return (NSString *)v9;
}

- (void)dragState
{
  if (a1)
  {
    BOOL v2 = a1;
    objc_super v3 = (void *)a1[5];
    if (!v3)
    {
      id v4 = objc_alloc_init(_UICollectionViewDragSourceControllerDragState);
      id v5 = (void *)v2[5];
      v2[5] = v4;

      objc_super v3 = (void *)v2[5];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)dragSession
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionViewDragSourceController sessionState](a1);
    BOOL v2 = (void *)v1;
    if (v1) {
      objc_super v3 = *(void **)(v1 + 8);
    }
    else {
      objc_super v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (uint64_t)currentSessionItemCount
{
  if (!a1) {
    return 0;
  }
  BOOL v2 = -[_UICollectionViewDragSourceController sessionState](a1);
  if (!v2)
  {
    id v5 = 0;
    uint64_t v3 = 0;
LABEL_7:

    return v3;
  }
  uint64_t v3 = v2[1];

  if (v3)
  {
    id v4 = -[_UICollectionViewDragSourceController sessionState](a1);
    id v5 = v4;
    if (v4) {
      id v4 = (void *)v4[1];
    }
    id v6 = [v4 items];
    uint64_t v3 = [v6 count];

    goto LABEL_7;
  }
  return v3;
}

- (id)dragFromIndexPaths
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionViewDragSourceController dragState](a1);
    BOOL v2 = -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v1);
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (id)dragFromIndexPath
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionViewDragSourceController dragState](a1);
    BOOL v2 = -[_UICollectionViewDragSourceControllerDragState dragFromDataSourceIndexPath](v1);
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (BOOL)dragItemsCreatedForReordering
{
  if (!a1) {
    return 0;
  }
  -[_UICollectionViewDragSourceController dragState](a1);
  uint64_t v1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v1) {
    BOOL v2 = v1[8] != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (id)indexPathForDragItem:(id *)a1
{
  BOOL v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = -[_UICollectionViewDragSourceController dragState](v2);
    id WeakRetained = objc_loadWeakRetained(v2 + 1);
    -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v4, v3, WeakRetained);
    BOOL v2 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)attemptToBeginDragImmediatelyWithTouch:(uint64_t)a1
{
  if (a1)
  {
    BOOL v2 = (id *)(a1 + 16);
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained _immediatelyBeginDragWithTouch:v3 completion:0];
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  v35 = WeakRetained;
  if (objc_msgSend(WeakRetained, "_canBeginReorderingItem", v32))
  {
    -[_UICollectionViewDragSourceController setSessionState:]((uint64_t)self);
    -[_UICollectionViewDragSourceController setDragState:]((uint64_t)self);
    [v6 locationInView:WeakRetained];
    v34 = objc_msgSend(WeakRetained, "indexPathForItemAtPoint:");
    id v8 = (id)MEMORY[0x1E4F1CBF0];
    if (v34)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__45;
      v54 = __Block_byref_object_dispose__45;
      id v55 = v8;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __82___UICollectionViewDragSourceController_dragInteraction_itemsForBeginningSession___block_invoke;
      v47[3] = &unk_1E52E3210;
      v49 = &v50;
      id v48 = WeakRetained;
      id v37 = v48;
      [v48 performUsingPresentationValues:v47];
      if ([(id)v51[5] containsObject:v34]
        && (v10 = objc_loadWeakRetained((id *)&self->_delegate)) != 0
        && (BOOL v11 = v10[41] == 0, v10, !v11))
      {
        v12 = [(_UICollectionViewDragSourceController *)self _filterCandidateIndexPaths:v51[5] forUserSelectedIndexPath:v34 session:v6];
        [v9 addObjectsFromArray:v12];
      }
      else
      {
        [v9 addObject:v34];
      }
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      obuint64_t j = v9;
      uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v58 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v44;
        double v15 = *MEMORY[0x1E4F1DAD8];
        double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v44 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            v19 = -[_UICollectionViewDragSourceController _queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:](self, "_queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:", v6, v18, 1, v15, v16);
            [(_UICollectionViewDragSourceController *)self _addDragItemsToExistingSession:v19 forDataSourceIndexPath:v18];
            [v8 addObjectsFromArray:v19];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v58 count:16];
        }
        while (v13);
      }

      if (![v8 count])
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v36 = obj;
        uint64_t v20 = [v36 countByEnumeratingWithState:&v39 objects:v57 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v40;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v40 != v21) {
                objc_enumerationMutation(v36);
              }
              uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * j);
              if ([v37 _canReorderItemAtIndexPath:v23])
              {
                id v24 = objc_alloc_init(MEMORY[0x1E4F28D78]);
                v25 = [[UIDragItem alloc] initWithItemProvider:v24];
                v56 = v25;
                v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
                [(_UICollectionViewDragSourceController *)self _addDragItemsToExistingSession:v26 forDataSourceIndexPath:v23];

                [v8 addObject:v25];
              }
            }
            uint64_t v20 = [v36 countByEnumeratingWithState:&v39 objects:v57 count:16];
          }
          while (v20);
        }

        if ([v8 count])
        {
          -[_UICollectionViewDragSourceController dragState](self);
          v27 = (unsigned char *)objc_claimAutoreleasedReturnValue();
          if (v27) {
            v27[8] = 1;
          }
        }
      }
      if (self) {
        v28 = (id **)objc_loadWeakRetained((id *)&self->_delegate);
      }
      else {
        v28 = 0;
      }
      v29 = -[_UICollectionViewDragSourceController dragState](self);
      v30 = -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v29);
      -[_UICollectionViewDragAndDropController dragSourceController:didUpdateItemsAtIndexPaths:](v28, (uint64_t)self, v30);

      _Block_object_dispose(&v50, 8);
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)setSessionState:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), 0);
  }
}

- (void)setDragState:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), 0);
  }
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = a4;
  id v7 = -[_UICollectionViewDragSourceController dragState](self);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  id v9 = -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v7, v6, WeakRetained);

  if (v9)
  {
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v10 = 0;
    }
    BOOL v11 = [v10 cellForItemAtIndexPath:v9];

    if (v11 && ([v11 window], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      uint64_t v13 = [(_UICollectionViewDragSourceController *)self _previewParametersForItemAtIndexPath:v9];
      uint64_t v14 = [UITargetedDragPreview alloc];
      if (v13) {
        uint64_t v15 = [(UITargetedPreview *)v14 initWithView:v11 parameters:v13];
      }
      else {
        uint64_t v15 = [(UITargetedDragPreview *)v14 initWithView:v11];
      }
      double v16 = (void *)v15;
    }
    else
    {
      double v16 = 0;
    }
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = -[_UICollectionViewDragSourceController dragState](self);
  v12 = -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v11);

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v18[3] = &unk_1E52D9960;
  objc_copyWeak(&v20, &location);
  id v13 = v12;
  id v19 = v13;
  [v9 addAnimations:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v15[3] = &unk_1E52E6710;
  objc_copyWeak(&v17, &location);
  id v14 = v13;
  id v16 = v14;
  [v9 addCompletion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    char v10 = [v8 _collectionView:WeakRetained prefersFullSizePreviewsForDragSession:v5];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v6 = self;
  char v7 = -[_UICollectionViewDragSourceController dragState](self);
  -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    id v6 = (_UICollectionViewDragSourceController *)WeakRetained;
    if (a5 <= 1)
    {
      if (WeakRetained) {
        -[_UICollectionViewDragDestinationController dropWasCancelled](*((void *)WeakRetained + 6));
      }
    }
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v16 = a4;
  id v6 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    id v9 = [WeakRetained _dragDelegateProxy];
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v10 = 0;
    }
    [v9 collectionView:v10 dragSessionDidEnd:v16];
  }
  else
  {
    BOOL v11 = [(_UICollectionViewDragSourceController *)self _dragSourceDelegateActual];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_14;
    }
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    id v9 = [WeakRetained _dragSourceDelegateProxy];
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v10 = 0;
    }
    [v9 _collectionView:v10 dragSessionDidEnd:v16];
  }

LABEL_14:
  id v13 = -[_UICollectionViewDragSourceController dragState](self);
  id v14 = -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v13);

  -[_UICollectionViewDragSourceController setSessionState:]((uint64_t)self);
  -[_UICollectionViewDragSourceController setDragState:]((uint64_t)self);
  if (self) {
    uint64_t v15 = (id *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    uint64_t v15 = 0;
  }
  -[_UICollectionViewDragAndDropController dragSourceController:didEndForItemsAtIndexPaths:](v15);
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  char v12 = objc_msgSend(WeakRetained, "indexPathForItemAtPoint:", x, y);

  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v13 = -[_UICollectionViewDragSourceController dragState](self);
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = v12;
    id v16 = [v14 dataSourceIndexPathsOfDraggingItems];
    char v17 = [v16 containsObject:v15];

    if (v17) {
      goto LABEL_11;
    }
  }
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp()
    && (uint64_t v18 = [v10 _dataOwner],
        v18 != [(_UICollectionViewDragSourceController *)self _dataOwnerForDragSession:v10 atIndexPath:v12]))
  {
LABEL_11:
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v19 = -[_UICollectionViewDragSourceController _queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:](self, "_queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:", v10, v12, 0, x, y);
    [(_UICollectionViewDragSourceController *)self _addDragItemsToExistingSession:v19 forDataSourceIndexPath:v12];
    uint64_t v20 = -[_UICollectionViewDragSourceController sessionState](self);
    uint64_t v21 = (void *)v20;
    if (v20 && (id v22 = *(id *)(v20 + 8)) != 0)
    {
    }
    else
    {
      uint64_t v24 = [v19 count];

      if (v24) {
        [(_UICollectionViewDragSourceController *)self _sessionWillBegin:v10 forDragInteraction:v9];
      }
    }
  }

  return v19;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v6 = a4;
  uint64_t v7 = -[_UICollectionViewDragSourceController sessionState](self);
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = *(void *)(v7 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = [v6 containsObject:v9];

  if (v10)
  {
    uint64_t v11 = -[_UICollectionViewDragSourceController sessionState](self);
    char v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = *(void **)(v11 + 8);
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;
  }
  else if ([v6 count] == 1)
  {
    id v14 = [v6 firstObject];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  if (self) {
    id WeakRetained = (id **)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v7 = -[_UICollectionViewDragSourceController dragFromIndexPaths](self);
  uint64_t v8 = [v7 count];
  if (WeakRetained)
  {
    -[_UICollectionViewDragDestinationController dragSourceSelectedItemCountDidChangeWithCount:](WeakRetained[6], v8);
    [WeakRetained _updatePreferredDraggedCellAppearanceForSessionUpdate];
  }
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a4;
  uint64_t v7 = -[_UICollectionViewDragSourceController dragState](self);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v9 = -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v7, v6, WeakRetained);

  if (v9)
  {
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = [v10 cellForItemAtIndexPath:v9];

    if (v11)
    {
      char v12 = [v11 window];

      if (v12)
      {
        uint64_t v13 = [(_UICollectionViewDragSourceController *)self _previewParametersForItemAtIndexPath:v9];
        id v14 = [UITargetedDragPreview alloc];
        if (v13) {
          uint64_t v15 = [(UITargetedPreview *)v14 initWithView:v11 parameters:v13];
        }
        else {
          uint64_t v15 = [(UITargetedDragPreview *)v14 initWithView:v11];
        }
        char v12 = (void *)v15;
      }
    }
    else
    {
      char v12 = 0;
    }
    if (self) {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id v16 = 0;
    }
    -[_UICollectionViewDragAndDropController dragSourceController:didSupplyCancellationPreviewForItemAtIndexPath:](v16);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = -[_UICollectionViewDragSourceController dragState](self);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v11 = -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v9, v7, WeakRetained);

  if (v11)
  {
    if (self)
    {
      char v12 = (id *)objc_loadWeakRetained((id *)&self->_delegate);
      v18[0] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      -[_UICollectionViewDragAndDropController dragSourceController:willBeginAnimatingCancelForItemsAtIndexPaths:withAnimator:](v12, (uint64_t)self, v13, v8);

      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      v18[0] = v11;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      -[_UICollectionViewDragAndDropController dragSourceController:willBeginAnimatingCancelForItemsAtIndexPaths:withAnimator:](0, 0, v15, v8);

      id v14 = 0;
    }
    -[_UICollectionViewDragAndDropController _performCancelDropToIndexPath:forDragItem:](v14, v11, v7);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92___UICollectionViewDragSourceController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
    v16[3] = &unk_1E52E6608;
    v16[4] = self;
    id v17 = v11;
    [v8 addCompletion:v16];
  }
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    char v10 = [v8 collectionView:WeakRetained dragSessionAllowsMoveOperation:v5];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    char v10 = [v8 collectionView:WeakRetained dragSessionIsRestrictedToDraggingApplication:v5];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  [v7 locationInView:WeakRetained];
  double v10 = v9;
  double v12 = v11;

  if (self) {
    id v13 = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id v13 = 0;
  }
  id v14 = objc_msgSend(v13, "indexPathForItemAtPoint:", v10, v12);

  int64_t v15 = [(_UICollectionViewDragSourceController *)self _dataOwnerForDragSession:v7 atIndexPath:v14];
  return v15;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  double v10 = objc_msgSend(WeakRetained, "indexPathForItemAtPoint:", x, y);

  int64_t v11 = [(_UICollectionViewDragSourceController *)self _dataOwnerForDragSession:v8 atIndexPath:v10];
  return v11;
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || (([(_UICollectionViewDragSourceController *)self _dragDelegateProxy],
         id v8 = objc_claimAutoreleasedReturnValue(),
         !self)
      ? (id WeakRetained = 0)
      : (id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView)),
        [v8 _collectionView:WeakRetained dragSessionPropertiesForSession:v5],
        double v10 = objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        v8,
        !v10))
  {
    int64_t v11 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      double v10 = objc_opt_new();
      id v13 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
      if (self) {
        self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
      }
      objc_msgSend(v10, "set_supportsSystemDrag:", objc_msgSend(v13, "_collectionView:dragSessionSupportsSystemDrag:", self, v5));
    }
    else
    {
      double v10 = 0;
    }
  }

  return v10;
}

- (int64_t)_dataOwnerForDragSession:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(_UICollectionViewDragSourceController *)self _dragDelegateActual],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    double v10 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    int64_t v12 = [v10 _collectionView:WeakRetained dataOwnerForDragSession:v6 atIndexPath:v7];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)_dragDelegateActual
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = [WeakRetained _dragDelegateActual];

  return v3;
}

- (id)_dragDelegateProxy
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = [WeakRetained _dragDelegateProxy];

  return v3;
}

- (id)_dragSourceDelegateActual
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = [WeakRetained _dragSourceDelegateActual];

  return v3;
}

- (id)_dragSourceDelegateProxy
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = [WeakRetained _dragSourceDelegateProxy];

  return v3;
}

- (BOOL)_delegateImplementsDragSourceItemsAtIndexPath
{
  return [(_UICollectionViewDragSourceController *)self _delegateImplementsSelector:sel__collectionView_dragSourceItemsForItemAtIndexPath_];
}

- (BOOL)_delegateImplementsDragItemsForItemAtIndexPath
{
  return [(_UICollectionViewDragSourceController *)self _delegateImplementsSelector:sel__collectionView_dragItemsForItemAtIndexPath_];
}

- (BOOL)_delegateImplementsDragItemsForItemAtIndexPathWithDefaultPreview
{
  return [(_UICollectionViewDragSourceController *)self _delegateImplementsSelector:sel__collectionView_dragItemsForItemAtIndexPath_defaultPreview_];
}

- (BOOL)_delegateImplementsDragSourceDidAddItem
{
  return [(_UICollectionViewDragSourceController *)self _delegateImplementsSelector:sel__collectionView_dragSourceDidAddDraggingItem_forItemAtIndexPath_];
}

- (BOOL)_delegateImplementsSelector:(SEL)a3
{
  p_collectionView = &self->_collectionView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  id v5 = [WeakRetained _dragSourceDelegateActual];
  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_collectionView);
    id v7 = [v6 _dragSourceDelegateActual];
    char v8 = objc_opt_respondsToSelector();
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)_addDragItemsToExistingSession:(id)a3 forDataSourceIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __95___UICollectionViewDragSourceController__addDragItemsToExistingSession_forDataSourceIndexPath___block_invoke;
    id v14 = &unk_1E52E6738;
    int64_t v15 = self;
    id v8 = v7;
    id v16 = v8;
    [v6 enumerateObjectsUsingBlock:&v11];
    uint64_t v9 = -[_UICollectionViewDragSourceController dragState](self);
    double v10 = (void *)v9;
    if (v8 && v9) {
      objc_msgSend(*(id *)(v9 + 16), "addObject:", v8, v11, v12, v13, v14, v15);
    }
  }
}

- (id)_queryForItemsFromClientForSession:(id)a3 dataSourceIndexPath:(id)a4 location:(CGPoint)a5 isInitialQuery:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  id v12 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  id v14 = [WeakRetained indexPathAfterShadowUpdates:v12];

  if (v14)
  {
    int64_t v15 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
    if (v6)
    {
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
        if (self) {
          self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
        }
        uint64_t v18 = [v17 collectionView:self itemsForBeginningDragSession:v11 atIndexPath:v14];
LABEL_21:
        uint64_t v24 = (void *)v18;

        goto LABEL_23;
      }
      uint64_t v20 = [(_UICollectionViewDragSourceController *)self _dragSourceDelegateActual];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        id v17 = [(_UICollectionViewDragSourceController *)self _dragSourceDelegateProxy];
        if (self) {
          self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
        }
        uint64_t v18 = [v17 _collectionView:self itemsForBeginningDragSession:v11 atIndexPath:v14];
        goto LABEL_21;
      }
    }
    else
    {
      int v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v17 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
        if (self) {
          self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
        }
        uint64_t v18 = objc_msgSend(v17, "collectionView:itemsForAddingToDragSession:atIndexPath:point:", self, v11, v14, x, y);
        goto LABEL_21;
      }
      id v22 = [(_UICollectionViewDragSourceController *)self _dragSourceDelegateActual];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        id v17 = [(_UICollectionViewDragSourceController *)self _dragSourceDelegateProxy];
        if (self) {
          self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
        }
        uint64_t v18 = objc_msgSend(v17, "_collectionView:itemsForAddingToDragSession:atIndexPath:point:", self, v11, v14, x, y);
        goto LABEL_21;
      }
    }
  }
  uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_23:

  return v24;
}

- (id)_previewParametersForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else {
    id WeakRetained = 0;
  }
  BOOL v6 = [WeakRetained _dragDelegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (self) {
      id v8 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v8 = 0;
    }
    uint64_t v9 = [v8 _dragDelegateProxy];
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = [v9 collectionView:v10 dragPreviewParametersForItemAtIndexPath:v4];
  }
  else
  {
    if (self) {
      id v12 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v12 = 0;
    }
    id v13 = [v12 _dragSourceDelegateActual];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_18;
    }
    if (self) {
      id v8 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v8 = 0;
    }
    uint64_t v9 = [v8 _dragSourceDelegateProxy];
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = [v9 _collectionView:v10 liftingPreviewParametersForItemAtIndexPath:v4];
  }
  int64_t v15 = (UIDragPreviewParameters *)v11;

  if (!v15)
  {
LABEL_18:
    if (self) {
      id v16 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v16 = 0;
    }
    id v17 = [v16 _cellForItemAtIndexPath:v4];

    uint64_t v18 = [v17 _visiblePathForBackgroundConfiguration];
    if (v18)
    {
      int64_t v15 = objc_alloc_init(UIDragPreviewParameters);
      [(UIPreviewParameters *)v15 setVisiblePath:v18];
    }
    else
    {
      int64_t v15 = 0;
    }
  }
  return v15;
}

- (void)_sessionWillBegin:(id)a3 forDragInteraction:(id)a4
{
  id v16 = a3;
  uint64_t v6 = -[_UICollectionViewDragSourceController sessionState](self);
  char v7 = (void *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 8), a3);
  }

  id v8 = [(_UICollectionViewDragSourceController *)self _dragDelegateActual];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v11 = [WeakRetained _dragDelegateProxy];
    if (self) {
      id v12 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v12 = 0;
    }
    [v11 collectionView:v12 dragSessionWillBegin:v16];
LABEL_15:

    goto LABEL_16;
  }
  id v13 = [(_UICollectionViewDragSourceController *)self _dragSourceDelegateActual];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v11 = [WeakRetained _dragSourceDelegateProxy];
    if (self) {
      id v12 = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id v12 = 0;
    }
    [v11 _collectionView:v12 dragSessionWillBegin:v16];
    goto LABEL_15;
  }
LABEL_16:
  if (self)
  {
    int64_t v15 = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_delegate);
    self = v15;
    if (v15) {
      [(_UICollectionViewDragSourceController *)v15 _incrementSessionRefCount];
    }
  }
}

- (id)_filterCandidateIndexPaths:(id)a3 forUserSelectedIndexPath:(id)a4 session:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  if ((_UIShouldEnforceOpenInRulesInAccountBasedApp() & 1) != 0
    && v9
    && (!self ? (id v10 = 0) : (id v10 = objc_loadWeakRetained((id *)&self->_collectionView)),
        [v10 _dragDelegateActual],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    id v13 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    }
    else {
      id WeakRetained = 0;
    }
    id v26 = v9;
    uint64_t v15 = [v13 _collectionView:WeakRetained dataOwnerForDragSession:v30 atIndexPath:v9];

    id v27 = v8;
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v8;
    uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * v19);
          char v21 = [(_UICollectionViewDragSourceController *)self _dragDelegateProxy];
          if (self) {
            id v22 = objc_loadWeakRetained((id *)&self->_collectionView);
          }
          else {
            id v22 = 0;
          }
          uint64_t v23 = [v21 _collectionView:v22 dataOwnerForDragSession:v30 atIndexPath:v20];

          if (v23 == v15) {
            [v28 addObject:v20];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        uint64_t v17 = v24;
      }
      while (v24);
    }

    id v9 = v26;
    id v8 = v27;
  }
  else
  {
    id v28 = v8;
  }

  return v28;
}

- (void)rebaseForUpdates:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[_UICollectionViewDragSourceController dragState](a1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewDragSourceControllerDragState rebaseForUpdates:](v4, v3);
  }
}

@end