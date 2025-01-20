@interface _UICollectionViewDragAndDropController
- (BOOL)_deleteShadowUpdateWithIdentifier:(id)a3;
- (BOOL)_removeMoveShadowUpdateMatchingReorderedItem:(id)a3;
- (BOOL)_shouldPerformTranslationForDelegateBasedFlowLayoutSizing;
- (BOOL)hasShadowUpdates;
- (BOOL)isCellInvolvedInDragOrDropAnimation:(uint64_t)a3 atIndexPath:;
- (BOOL)isDragDestinationInteractivelyReordering;
- (BOOL)placeholderContext:(id)a3 didCommitInsertionWithDataSourceUpdates:(id)a4;
- (BOOL)rebaseForUpdates:(id)a3;
- (BOOL)updateWillCauseInternalInconsistency:(uint64_t)a1;
- (NSArray)items;
- (NSIndexPath)destinationIndexPath;
- (NSString)description;
- (UICollectionViewDropProposal)proposal;
- (UIDropSession)session;
- (_UICollectionViewDragAndDropController)initWithCollectionView:(id)a3;
- (id)_cellAppearanceStateForIndexPath:(id)a3;
- (id)_cellForDropCoordinatorItem:(id)a3;
- (id)_dropCoordinatorItemForDragItem:(id)a3;
- (id)_dropCoordinatorItemForIndexPath:(id)a3;
- (id)_presentationIndexPathForIndexPath:(id)a3 allowingAppendingInserts:(BOOL)a4;
- (id)_shadowUpdateReuseIdentifierForItemItemAtIndexPath:(id)a3;
- (id)cancelReorderingForced:(uint64_t *)a1;
- (id)dropItem:(id)a3 intoItemAtIndexPath:(id)a4 rect:(CGRect)a5;
- (id)dropItem:(id)a3 toItemAtIndexPath:(id)a4;
- (id)dropItem:(id)a3 toPlaceholder:(id)a4;
- (id)dropItem:(id)a3 toPlaceholderInsertedAtIndexPath:(id)a4 withReuseIdentifier:(id)a5 cellUpdateHandler:(id)a6;
- (id)dropItem:(id)a3 toTarget:(id)a4;
- (id)dropToPlaceholderCellAtIndexPath:(id)a3 reuseIdentifier:(id)a4 forDragItem:(id)a5 cellUpdateHandler:(id)a6;
- (id)dropToPlaceholderInsertedAtIndexPath:(id)a3 reuseIdentifier:(id)a4 forDragItem:(id)a5 cellUpdateHandler:(id)a6;
- (id)endReordering;
- (id)indexPathForDragAndDropInsertion;
- (id)indexPathForOriginalReorderedItem;
- (id)insertPlaceholderForItemAtIndexPath:(id)a3 forDragItem:(id)a4 reuseIdentifier:(id)a5 cellUpdateHandler:(id)a6;
- (id)placeholderContextDidDismiss:(id)a3;
- (id)reorderedItems;
- (id)sourceIndexPaths;
- (id)updateReorderingForTargetPosition:(double)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (uint64_t)canBeginReorderingSession;
- (uint64_t)effectiveDragDestinationVisualStyle;
- (uint64_t)isCellPerformingLegacyReorderingAtIndexPath:(uint64_t)a1;
- (void)_addAnimationHandlers:(id)a3 toAnimator:(id)a4;
- (void)_addDropCoordinatorItem:(id)a3;
- (void)_cleanupAfterOutstandingSessionCompletion;
- (void)_decrementSessionRefCount;
- (void)_incrementSessionRefCount;
- (void)_invokeAllCompletionHandlers;
- (void)_performCancelDropToIndexPath:(void *)a3 forDragItem:;
- (void)_removeAnyDeferredReuseCells;
- (void)_resetAllAnimationHandlers;
- (void)_resetReorderedItems;
- (void)_rollbackCurrentDropInsertion;
- (void)_updateCellAppearancesForItemsAtIndexPaths:(id)a3;
- (void)_updateCellIfNeeded:(id)a3 atIndexPath:(id)a4;
- (void)_updatePreferredDraggedCellAppearanceForSessionUpdate;
- (void)beginReorderingForItemAtIndexPath:(void *)a3 cell:;
- (void)commitReorderedItems;
- (void)defaultAnimationHandlers;
- (void)didUpdateDataSource;
- (void)didUpdateDragDelegate;
- (void)didUpdateDropDelegate;
- (void)dragDestinationController:(void *)a1 didCompleteDropAnimationForDragItem:;
- (void)dragDestinationController:(void *)a3 willBeginDropAnimationForDragItem:(void *)a4 animator:;
- (void)dragDestinationControllerSessionDidEnter:(int)a3 isNewSession:(int)a4 isResuming:;
- (void)dragSourceController:(id *)a1 didEndForItemsAtIndexPaths:;
- (void)dragSourceController:(void *)a1 didSupplyCancellationPreviewForItemAtIndexPath:;
- (void)dragSourceController:(void *)a3 didCancelLiftForItemsAtIndexPaths:;
- (void)dragSourceController:(void *)a3 didCompleteLiftForItemsAtIndexPaths:;
- (void)dragSourceController:(void *)a3 didUpdateItemsAtIndexPaths:;
- (void)dragSourceController:(void *)a3 willBeginAnimatingCancelForItemsAtIndexPaths:(void *)a4 withAnimator:;
- (void)dragSourceController:(void *)a3 willBeginLiftForItemsAtIndexPaths:;
- (void)dropToItemAtIndexPath:(id)a3 forDragItem:(id)a4;
- (void)dropToLocation:(CGPoint)a3 inContainerView:(id)a4 withTransform:(CGAffineTransform *)a5 forDragItem:(id)a6;
- (void)dropToTarget:(id)a3 forDragItem:(id)a4;
- (void)placeholderContextNeedsCellUpdate:(id)a3;
- (void)placeholderContextsByIndexPath;
- (void)rebaseCellAppearanceStatesForUpdates:(uint64_t)a1;
- (void)reset;
- (void)setCurrentDropInsertionShadowUpdateIdentifier:(uint64_t)a1;
- (void)setCurrentlyInsertingPlaceholderContext:(uint64_t)a1;
- (void)setDragInteractionEnabled:(uint64_t)a1;
- (void)setDropCoordinatorItemsMap:(uint64_t)a1;
- (void)setPlaceholderContextsByIndexPath:(uint64_t)a1;
- (void)updateAppearanceForCell:(void *)a3 atIndexPath:;
@end

@implementation _UICollectionViewDragAndDropController

- (id)reorderedItems
{
  if (a1)
  {
    a1 = (id *)[a1[21] copy];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)updateAppearanceForCell:(void *)a3 atIndexPath:
{
  id v14 = a2;
  id v5 = a3;
  if (a1 && v14 && v5)
  {
    -[_UICollectionViewSubviewCollection cellAtIndexPath:](*(id **)(a1 + 104), (uint64_t)v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6) {
      BOOL v7 = v6 == v14;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      [v6 _setDragAppearance:0];
      uint64_t v8 = *(void *)(a1 + 104);
      if (v8) {
        [*(id *)(v8 + 8) removeObjectForKey:v5];
      }
    }
    uint64_t v9 = [*(id *)(a1 + 112) objectForKeyedSubscript:v5];
    v10 = (void *)v9;
    if (v9)
    {
      int v11 = *(_DWORD *)(v9 + 12);
      if (v11 == 6)
      {
        uint64_t v13 = 2 * *(unsigned __int8 *)(v9 + 10);
        uint64_t v12 = (uint64_t)v14;
      }
      else
      {
        uint64_t v12 = (uint64_t)v14;
        if (v11 == 3)
        {
          if (*(unsigned char *)(v9 + 10)) {
            uint64_t v13 = 2;
          }
          else {
            uint64_t v13 = 3;
          }
        }
        else
        {
          uint64_t v13 = v11 == 1;
        }
      }
      -[_UICollectionViewSubviewCollection setCell:atIndexPath:](*(void *)(a1 + 104), v12, (uint64_t)v5);
      [v14 _setDragAppearance:v13];
    }
  }
}

- (BOOL)updateWillCauseInternalInconsistency:(uint64_t)a1
{
  v3 = a2;
  v4 = v3;
  if (a1 && [v3 updateAction] == 1)
  {
    id v5 = -[_UICollectionViewDragAndDropController indexPathForOriginalReorderedItem](a1);
    if (v5)
    {
      id v6 = -[UICollectionViewUpdateItem _indexPath](v4);
      BOOL v8 = 1;
      if (([v6 isEqual:v5] & 1) == 0)
      {
        if (!v4
          || v4[6] != 0x7FFFFFFFFFFFFFFFLL
          || (uint64_t v7 = [v6 section], v7 != objc_msgSend(v5, "section")))
        {
          BOOL v8 = 0;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)indexPathForOriginalReorderedItem
{
  if (a1 && *(void *)(a1 + 64) != 3)
  {
    v2 = [*(id *)(a1 + 168) firstObject];
    v3 = v2;
    if (v2)
    {
      uint64_t v1 = [v2 originalIndexPath];
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  else
  {
    uint64_t v1 = 0;
  }
  return v1;
}

- (BOOL)hasShadowUpdates
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 _shadowUpdates];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (BOOL)isCellInvolvedInDragOrDropAnimation:(uint64_t)a3 atIndexPath:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [(id)a1 _dropCoordinatorItemForIndexPath:a3];
    uint64_t v7 = v6;
    if (v6 && [v6 shouldRemainInHierarchy])
    {
      id v8 = [(id)a1 _cellForDropCoordinatorItem:v7];
      a1 = v8 == v5;
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)_dropCoordinatorItemForIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    if (self)
    {
      dropCoordinatorItemsMap = self->_dropCoordinatorItemsMap;
      if (!dropCoordinatorItemsMap)
      {
        id v6 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
        uint64_t v7 = self->_dropCoordinatorItemsMap;
        self->_dropCoordinatorItemsMap = v6;

        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = self->_dropCoordinatorItems;
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              id v14 = objc_msgSend(v13, "destinationIndexPath", (void)v18);
              if (v14) {
                [(NSMapTable *)self->_dropCoordinatorItemsMap setObject:v13 forKey:v14];
              }
            }
            uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v10);
        }

        dropCoordinatorItemsMap = self->_dropCoordinatorItemsMap;
      }
      v15 = dropCoordinatorItemsMap;
    }
    else
    {
      v15 = 0;
    }
    v16 = -[NSMapTable objectForKey:](v15, "objectForKey:", v4, (void)v18);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void)commitReorderedItems
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    id v1 = *(id *)(a1 + 168);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "commitTargetIndexPath", (void)v6);
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

- (uint64_t)isCellPerformingLegacyReorderingAtIndexPath:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    if (*(void *)(a1 + 64) == 1)
    {
      long long v6 = -[_UICollectionViewDragAndDropController indexPathForDragAndDropInsertion](a1);
      id v7 = v4;
      id v8 = v6;
      long long v9 = v8;
      if (v8 == v7)
      {
        uint64_t v5 = 1;
        uint64_t v11 = v7;
      }
      else
      {
        if (v8)
        {
          char v10 = [v7 isEqual:v8];

          if (v10)
          {
            uint64_t v5 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {
        }
        uint64_t v12 = -[_UICollectionViewDragAndDropController indexPathForOriginalReorderedItem](a1);
        id v7 = v7;
        id v13 = v12;
        uint64_t v11 = v13;
        if (v13 == v7)
        {
          uint64_t v5 = 1;
        }
        else if (v13)
        {
          uint64_t v5 = [v7 isEqual:v13];
        }
        else
        {
          uint64_t v5 = 0;
        }
      }
      goto LABEL_18;
    }
    uint64_t v5 = 0;
  }
LABEL_19:

  return v5;
}

- (void)didUpdateDataSource
{
  if (a1)
  {
    if (!*(void *)(a1 + 56)) {
      -[_UICollectionViewDragAndDropController didUpdateDragDelegate]((id *)a1);
    }
    if (!*(void *)(a1 + 48))
    {
      -[_UICollectionViewDragAndDropController didUpdateDropDelegate]((id *)a1);
    }
  }
}

- (void)didUpdateDropDelegate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 collectionView];
    id v3 = a1[6];
    uint64_t v4 = v3;
    if (v3)
    {
      if (-[_UICollectionViewDragDestinationController isActive](v3))
      {
        uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionView", &didUpdateDropDelegate___s_category) + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138412290;
          uint64_t v11 = v2;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Warning: Changing the dropDelegate while a drag session is active will lead to undefined behavior. %@", (uint8_t *)&v10, 0xCu);
        }
      }
      -[_UICollectionViewDragDestinationController deactivate]((uint64_t)v4);
      id v6 = a1[6];
      a1[6] = 0;
    }
    id v7 = [v2 dropDelegate];
    if (v7 || ([v2 dragDestinationDelegate], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else if (([v2 _dragAndDropNeededForReordering] & 1) == 0)
    {
      goto LABEL_11;
    }
    uint64_t v8 = +[_UICollectionViewDragDestinationController controllerForCollectionView:delegate:]((uint64_t)_UICollectionViewDragDestinationController, v2, a1);
    id v9 = a1[6];
    a1[6] = (id)v8;

LABEL_11:
  }
}

- (void)didUpdateDragDelegate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 collectionView];
    id v3 = a1[7];
    uint64_t v4 = v3;
    if (v3)
    {
      if (-[_UICollectionViewDragSourceController isActive](v3))
      {
        uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionView", &didUpdateDragDelegate___s_category) + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138412290;
          uint64_t v11 = v2;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Warning: Changing the dragDelegate while a drag session is active will lead to undefined behavior. %@", (uint8_t *)&v10, 0xCu);
        }
      }
      -[_UICollectionViewDragSourceController deactivate]((uint64_t)v4);
      id v6 = a1[7];
      a1[7] = 0;
    }
    id v7 = [v2 dragDelegate];
    if (v7 || ([v2 dragSourceDelegate], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else if (([v2 _dragAndDropNeededForReordering] & 1) == 0)
    {
      goto LABEL_11;
    }
    uint64_t v8 = +[_UICollectionViewDragDestinationController controllerForCollectionView:delegate:]((uint64_t)_UICollectionViewDragSourceController, v2, a1);
    id v9 = a1[7];
    a1[7] = (id)v8;

    -[_UICollectionViewDragSourceController setDragInteractionEnabled:]((uint64_t)a1[7], [v2 dragInteractionEnabled]);
LABEL_11:
  }
}

- (_UICollectionViewDragAndDropController)initWithCollectionView:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_UICollectionViewDragAndDropController;
  id v3 = [(_UICollectionViewShadowUpdatesController *)&v17 initWithCollectionView:a3];
  if (v3)
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    reorderedItems = v3->__reorderedItems;
    v3->__reorderedItems = v4;

    id v6 = objc_alloc_init(_UICollectionViewSubviewCollection);
    viewsWithAppearanceUpdates = v3->_viewsWithAppearanceUpdates;
    v3->_viewsWithAppearanceUpdates = v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cellAppearanceStatesByIndexPaths = v3->_cellAppearanceStatesByIndexPaths;
    v3->_cellAppearanceStatesByIndexPaths = v8;

    int v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    placeholderContexts = v3->_placeholderContexts;
    v3->_placeholderContexts = v10;

    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dropCoordinatorItems = v3->_dropCoordinatorItems;
    v3->_dropCoordinatorItems = v12;

    id v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cellsDeferredForReuse = v3->_cellsDeferredForReuse;
    v3->_cellsDeferredForReuse = v14;

    v3->_dragInteractionEnabled = 1;
    v3->_flockSelectedItemsOnDrag = 1;
    [(_UICollectionViewDragAndDropController *)v3 reset];
  }
  return v3;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewDragAndDropController;
  [(_UICollectionViewShadowUpdatesController *)&v4 reset];
  [(_UICollectionViewDragAndDropController *)self _resetReorderedItems];
  if (self) {
    placeholderContexts = self->_placeholderContexts;
  }
  else {
    placeholderContexts = 0;
  }
  [(NSMutableSet *)placeholderContexts removeAllObjects];
  -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)self);
  -[_UICollectionViewDragAndDropController setCurrentDropInsertionShadowUpdateIdentifier:]((uint64_t)self);
}

- (void)setPlaceholderContextsByIndexPath:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), 0);
  }
}

- (void)setCurrentDropInsertionShadowUpdateIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 160), 0);
  }
}

- (void)_resetReorderedItems
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (self) {
    reorderedItems = self->__reorderedItems;
  }
  else {
    reorderedItems = 0;
  }
  objc_super v4 = reorderedItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "cell", (void)v10);
        [v9 _setReordering:0];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if (self)
  {
    [(NSMutableArray *)self->__reorderedItems removeAllObjects];
    self->_hasReorderedItemInSession = 0;
  }
  else
  {
    [0 removeAllObjects];
  }
}

- (void)setDragInteractionEnabled:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 40) != a2)
    {
      *(unsigned char *)(a1 + 40) = a2;
      -[_UICollectionViewDragSourceController setDragInteractionEnabled:](*(void *)(a1 + 56), a2);
    }
  }
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  objc_super v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@:%p -", v5, self];

  if (self)
  {
    objc_msgSend(v6, "appendFormat:", @"sessionKind = %ld;", self->_sessionKind);
    reorderedItems = self->__reorderedItems;
  }
  else
  {
    objc_msgSend(v6, "appendFormat:", @"sessionKind = %ld;", 0);
    reorderedItems = 0;
  }
  [v6 appendFormat:@" reorderedItems = %@;", reorderedItems];
  uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  [v6 appendFormat:@" shadowUpdates=%@;", v8];

  if (self)
  {
    objc_msgSend(v6, "appendFormat:", @" cellAppearanceStatesByIndexPaths=%@; ",
      self->_cellAppearanceStatesByIndexPaths);
    [v6 appendFormat:@" placeholderContexts = %@;", self->_placeholderContexts];
    [v6 appendFormat:@" source=%@;", self->_sourceController];
    destinationController = self->_destinationController;
  }
  else
  {
    [v6 appendFormat:@" cellAppearanceStatesByIndexPaths=%@; ", 0];
    [v6 appendFormat:@" placeholderContexts = %@;", 0];
    [v6 appendFormat:@" source=%@;", 0];
    destinationController = 0;
  }
  [v6 appendFormat:@" destination=%@", destinationController];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (uint64_t)canBeginReorderingSession
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v1 = (void *)result;
    if (*(void *)(result + 64)) {
      return 0;
    }
    if (![*(id *)(result + 96) count]) {
      return 1;
    }
    if (os_variant_has_internal_diagnostics())
    {
      id v3 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      objc_super v4 = [v1 collectionView];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_fault_impl(&dword_1853B0000, v3, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: unable to begin reordering session due to the presence of placeholder contexts. Collection view: %@", (uint8_t *)&v5, 0xCu);
LABEL_9:

LABEL_10:
      return 0;
    }
    uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &canBeginReorderingSession___s_category) + 8);
    result = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (result)
    {
      id v3 = v2;
      objc_super v4 = [v1 collectionView];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: unable to begin reordering session due to the presence of placeholder contexts. Collection view: %@", (uint8_t *)&v5, 0xCu);
      goto LABEL_9;
    }
  }
  return result;
}

- (void)beginReorderingForItemAtIndexPath:(void *)a3 cell:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6) {
        goto LABEL_4;
      }
    }
    else
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:sel_beginReorderingForItemAtIndexPath_cell_, a1, @"_UICollectionViewDragAndDropController.m", 199, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

      if (v7) {
        goto LABEL_4;
      }
    }
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:sel_beginReorderingForItemAtIndexPath_cell_, a1, @"_UICollectionViewDragAndDropController.m", 200, @"Invalid parameter not satisfying: %@", @"cell != nil" object file lineNumber description];

LABEL_4:
    uint64_t v8 = [(id)a1 collectionView];
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 64);
    if (v10 == 3)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __81___UICollectionViewDragAndDropController_beginReorderingForItemAtIndexPath_cell___block_invoke;
      v27[3] = &unk_1E52D9F98;
      id v14 = v8;
      id v28 = v14;
      id v15 = v5;
      id v29 = v15;
      v16 = [v14 _performShadowUpdates:v27];
      uint64_t v17 = [v16 firstObject];
      long long v18 = (void *)v17;
      if (v17)
      {
        long long v19 = *(void **)(v17 + 88);
      }
      else
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:sel_beginReorderingForItemAtIndexPath_cell_, a1, @"_UICollectionViewDragAndDropController.m", 216, @"UICollectionView internal consistency: shadow insert for placeholder cell is nil. Collection view: %@", v14 object file lineNumber description];

        long long v19 = 0;
      }
      objc_storeStrong((id *)(a1 + 160), v19);
      long long v20 = [v14 _cellForItemAtIndexPath:v15];
      if (!v20)
      {
        [MEMORY[0x1E4F28B00] currentHandler];
        v25 = id v26 = v14;
        [v25 handleFailureInMethod:sel_beginReorderingForItemAtIndexPath_cell_, a1, @"_UICollectionViewDragAndDropController.m", 220, @"UICollectionView internal consistency: unable to retrieve placeholder cell for reordering. Collection view: %@", v26 object file lineNumber description];
      }
      long long v21 = [[UICollectionViewReorderedItem alloc] initWithCell:v20 indexPath:v15];
      [*(id *)(a1 + 168) addObject:v21];

      goto LABEL_17;
    }
    if (v10 != 1)
    {
      if (v10)
      {
LABEL_9:
        long long v11 = [[UICollectionViewReorderedItem alloc] initWithCell:v7 indexPath:v5];
        [*(id *)(a1 + 168) addObject:v11];
        long long v12 = [v9 _diffableDataSourceImpl];
        long long v13 = v12;
        if (v12) {
          [v12 _willBeginReorderingForItemAtIndexPath:v5];
        }

LABEL_17:
        goto LABEL_18;
      }
      *(void *)(a1 + 64) = 1;
    }
    [v7 _setReordering:1];
    goto LABEL_9;
  }
LABEL_18:
}

- (id)updateReorderingForTargetPosition:(double)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v38 = 0;
    goto LABEL_39;
  }
  id v6 = *(id *)(a1 + 168);
  id v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (!*(void *)(a1 + 64) || -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle](a1) == 2) {
    goto LABEL_38;
  }
  int v36 = *(unsigned __int8 *)(a1 + 43);
  BOOL v39 = v36 != 0;
  uint64_t v7 = [(id)a1 collectionView];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v37 = v6;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (!v8) {
    goto LABEL_35;
  }
  uint64_t v10 = v8;
  uint64_t v11 = *(void *)v42;
  *(void *)&long long v9 = 138412546;
  long long v35 = v9;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(obj);
      }
      long long v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      id v14 = objc_msgSend(v13, "originalIndexPath", v35);
      id v15 = [v13 targetIndexPath];
      if (os_variant_has_internal_diagnostics())
      {
        if (!v15)
        {
          v27 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            v31 = __UICVIndexPathDescription(v14);
            *(_DWORD *)buf = v35;
            v46 = v7;
            __int16 v47 = 2112;
            v48 = v31;
            _os_log_fault_impl(&dword_1853B0000, v27, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: expected reordered item to have a previous index path. Please file a bug against UICollectionView with reproduction steps. Collection view: %@; Original index path: %@",
              buf,
              0x16u);
          }
        }
      }
      else if (!v15)
      {
        id v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateReorderingForTargetPosition____s_category) + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          id v29 = v28;
          v30 = __UICVIndexPathDescription(v14);
          *(_DWORD *)buf = v35;
          v46 = v7;
          __int16 v47 = 2112;
          v48 = v30;
          _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: expected reordered item to have a previous index path. Please file a bug against UICollectionView with reproduction steps. Collection view: %@; Original index path: %@",
            buf,
            0x16u);
        }
      }
      if (*(void *)(a1 + 64) != 2)
      {
        uint64_t v17 = [v7 collectionViewLayout];
        objc_msgSend(v17, "_targetPositionForInteractiveMovementOfItemAtIndexPath:withProposedTargetPosition:", v14, a2, a3);
        double v19 = v18;
        double v21 = v20;

        v22 = [v7 collectionViewLayout];
        uint64_t v23 = objc_msgSend(v22, "_reorderingTargetItemIndexPathForPosition:withPreviousIndexPath:", v15, v19, v21);

        if (!v23)
        {
LABEL_22:
          v16 = 0;
          goto LABEL_23;
        }
        v16 = [v7 _targetIndexPathForMoveOfItemFromOriginalIndexPath:v14 atCurrentIndexPath:v15 toProposedIndexPath:v23];

        if (!v15) {
          goto LABEL_23;
        }
LABEL_17:
        if (v16)
        {
          id v24 = v16;
          if (v15 == v24)
          {

            v16 = v15;
          }
          else
          {
            v16 = v24;
            char v25 = [v15 isEqual:v24];

            if ((v25 & 1) == 0)
            {
              [v38 setObject:v16 forKeyedSubscript:v15];
              [v13 setTargetIndexPath:v16];
              if (v39) {
                LOBYTE(v26) = 1;
              }
              else {
                int v26 = [v13 isNOOP] ^ 1;
              }
              BOOL v39 = v26;
            }
          }
        }
        goto LABEL_23;
      }
      if (!-[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](*(void **)(a1 + 48))) {
        goto LABEL_22;
      }
      v16 = [(id)a1 destinationIndexPath];
      if (v15) {
        goto LABEL_17;
      }
LABEL_23:

      ++v12;
    }
    while (v10 != v12);
    uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    uint64_t v10 = v32;
  }
  while (v32);
LABEL_35:

  int v33 = v39;
  if ((v36 != 0) != v33)
  {
    *(unsigned char *)(a1 + 43) = v33;
    [(id)a1 _updatePreferredDraggedCellAppearanceForSessionUpdate];
  }

  id v6 = v37;
LABEL_38:

LABEL_39:
  return v38;
}

- (uint64_t)effectiveDragDestinationVisualStyle
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [(id)result collectionView];
    unint64_t v3 = [v2 traitCollection];
    objc_super v4 = (void *)v3;
    if (v3) {
      _UIRecordTraitUsage(v3, 0x13uLL);
    }

    if (*(void *)(v1 + 72) == 2) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (id)cancelReorderingForced:(uint64_t *)a1
{
  if (a1)
  {
    uint64_t v3 = a1[8];
    switch(v3)
    {
      case 1:
        [a1 reset];
        a1[8] = 0;
        break;
      case 3:
        if (a2)
        {
          id v5 = [a1 collectionView];
          [a1 reset];
          -[_UICollectionViewDragDestinationController suspendDrops](a1[6]);
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_3;
          v8[3] = &unk_1E52D9F70;
          v8[4] = a1;
          objc_super v4 = _Block_copy(v8);

          goto LABEL_11;
        }
        [a1 _rollbackCurrentDropInsertion];
        break;
      case 2:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_2;
        aBlock[3] = &unk_1E52D9F70;
        aBlock[4] = a1;
        objc_super v4 = _Block_copy(aBlock);
LABEL_11:
        id v6 = _Block_copy(v4);

        goto LABEL_12;
    }
    objc_super v4 = &__block_literal_global_117;
    goto LABEL_11;
  }
  id v6 = 0;
LABEL_12:
  return v6;
}

- (id)endReordering
{
  if (a1)
  {
    uint64_t v2 = a1[8];
    switch(v2)
    {
      case 1:
        [a1 reset];
        a1[8] = 0;
        break;
      case 3:
        [a1 _rollbackCurrentDropInsertion];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __55___UICollectionViewDragAndDropController_endReordering__block_invoke_2;
        aBlock[3] = &unk_1E52D9F70;
        aBlock[4] = a1;
        uint64_t v3 = _Block_copy(aBlock);
LABEL_9:
        objc_super v4 = _Block_copy(v3);

        goto LABEL_10;
      case 2:
        [a1 reset];
        break;
    }
    uint64_t v3 = &__block_literal_global_56_0;
    goto LABEL_9;
  }
  objc_super v4 = 0;
LABEL_10:
  return v4;
}

- (BOOL)isDragDestinationInteractivelyReordering
{
  return -[_UICollectionViewDragDestinationController supportsLocalSessionReordering]((id *)&self->_destinationController->super.isa);
}

- (id)indexPathForDragAndDropInsertion
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 168) firstObject];
    uint64_t v2 = v1;
    if (v1)
    {
      uint64_t v3 = [v1 targetIndexPath];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)_shouldPerformTranslationForDelegateBasedFlowLayoutSizing
{
  return !self || self->_sessionKind != 1;
}

- (id)_dropCoordinatorItemForDragItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if (self) {
    dropCoordinatorItems = self->_dropCoordinatorItems;
  }
  else {
    dropCoordinatorItems = 0;
  }
  id v6 = dropCoordinatorItems;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "dragItem", (void)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)_cellForDropCoordinatorItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 destinationIndexPath];

  if (v5)
  {
    id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v7 = [v4 destinationIndexPath];
    uint64_t v8 = [v6 _cellForItemAtIndexPath:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_incrementSessionRefCount
{
  if (self) {
    ++self->_sessionRefCount;
  }
}

- (void)_decrementSessionRefCount
{
  if (!self) {
    goto LABEL_5;
  }
  int64_t sessionRefCount = self->_sessionRefCount;
  if (sessionRefCount >= 1) {
    self->_int64_t sessionRefCount = --sessionRefCount;
  }
  if (!sessionRefCount) {
LABEL_5:
  }
    [(_UICollectionViewDragAndDropController *)self _cleanupAfterOutstandingSessionCompletion];
}

- (void)_cleanupAfterOutstandingSessionCompletion
{
  if (dyld_program_sdk_at_least())
  {
    BOOL v3 = -[_UICollectionViewDragAndDropController hasShadowUpdates](self);
    if (self)
    {
      if (self->_sessionKind == 3 && v3) {
        -[_UICollectionViewDragDestinationController dropWasCancelled]((uint64_t)self->_destinationController);
      }
    }
  }
  -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:]((uint64_t)self->_viewsWithAppearanceUpdates, (uint64_t)&__block_literal_global_65_0);
  viewsWithAppearanceUpdates = self->_viewsWithAppearanceUpdates;
  if (viewsWithAppearanceUpdates)
  {
    [(NSMutableDictionary *)viewsWithAppearanceUpdates->_cells removeAllObjects];
    [(NSMutableDictionary *)viewsWithAppearanceUpdates->_supplementaries removeAllObjects];
    [(NSMutableDictionary *)viewsWithAppearanceUpdates->_decorations removeAllObjects];
  }
  [(NSMutableDictionary *)self->_cellAppearanceStatesByIndexPaths removeAllObjects];
  [(NSMutableArray *)self->_dropCoordinatorItems removeAllObjects];
  -[_UICollectionViewDragAndDropController setDropCoordinatorItemsMap:]((uint64_t)self);
  objc_storeStrong((id *)&self->_defaultAnimationHandlers, 0);
  [(_UICollectionViewDragAndDropController *)self _removeAnyDeferredReuseCells];
  self->_sessionKind = 0;
}

- (void)setDropCoordinatorItemsMap:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), 0);
  }
}

- (void)_removeAnyDeferredReuseCells
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (self) {
    cellsDeferredForReuse = self->_cellsDeferredForReuse;
  }
  else {
    cellsDeferredForReuse = 0;
  }
  id v4 = cellsDeferredForReuse;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
        id v11 = [v10 visibleCells];
        char v12 = [v11 containsObject:v9];

        if ((v12 & 1) == 0)
        {
          long long v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
          [v13 _reuseCell:v9 notifyDidEndDisplaying:0];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  if (self) {
    long long v14 = self->_cellsDeferredForReuse;
  }
  else {
    long long v14 = 0;
  }
  [(NSMutableSet *)v14 removeAllObjects];
}

- (void)rebaseCellAppearanceStatesForUpdates:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [*(id *)(a1 + 112) allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v11 = [*(id *)(a1 + 112) objectForKeyedSubscript:v10];
          char v12 = v3[2](v3, v10);
          if (v12) {
            [v4 setObject:v11 forKeyedSubscript:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }

    long long v13 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = v4;
    id v14 = v4;

    long long v15 = objc_alloc_init(_UICollectionViewSubviewCollection);
    uint64_t v16 = *(void *)(a1 + 104);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79___UICollectionViewDragAndDropController_rebaseCellAppearanceStatesForUpdates___block_invoke;
    v20[3] = &unk_1E52E65B8;
    v22 = v3;
    long long v17 = v15;
    double v21 = v17;
    -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:](v16, (uint64_t)v20);
    long long v18 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v17;
    double v19 = v17;
  }
}

- (void)_updatePreferredDraggedCellAppearanceForSessionUpdate
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    BOOL v3 = !self->_hasReorderedItemInSession;
    uint64_t v4 = -[_UICollectionViewDragSourceController currentSessionItemCount](&self->_sourceController->super.isa);
    destinationController = self->_destinationController;
  }
  else
  {
    uint64_t v4 = -[_UICollectionViewDragSourceController currentSessionItemCount](0);
    destinationController = 0;
    BOOL v3 = 1;
  }
  BOOL v6 = -[_UICollectionViewDragDestinationController supportsLocalSessionReordering]((id *)&destinationController->super.isa);
  uint64_t v7 = -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle]((uint64_t)self);
  char v8 = !v6;
  if (v7 == 2) {
    char v8 = 1;
  }
  if (v4 > 1) {
    char v8 = 1;
  }
  if (v3) {
    char v9 = 1;
  }
  else {
    char v9 = v8;
  }
  uint64_t v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = &OBJC_IVAR___UITab__hiddenByDefault;
  if (self) {
    cellAppearanceStatesByIndexPaths = self->_cellAppearanceStatesByIndexPaths;
  }
  else {
    cellAppearanceStatesByIndexPaths = 0;
  }
  id obj = [(NSMutableDictionary *)cellAppearanceStatesByIndexPaths keyEnumerator];
  uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
        long long v18 = v11;
        if (self) {
          double v19 = *(Class *)((char *)&self->super.super.isa + v11[276]);
        }
        else {
          double v19 = 0;
        }
        uint64_t v20 = [v19 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * v16)];
        double v21 = (void *)v20;
        if (v20) {
          *(unsigned char *)(v20 + 10) = v9;
        }
        v22 = [v10 cellForItemAtIndexPath:v17];
        -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)self, v22, v17);

        ++v16;
        id v11 = v18;
      }
      while (v14 != v16);
      uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v14 = v23;
    }
    while (v23);
  }
}

- (void)_rollbackCurrentDropInsertion
{
  BOOL v3 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  if (self)
  {
    currentDropInsertionShadowUpdateIdentifier = self->_currentDropInsertionShadowUpdateIdentifier;
    if (currentDropInsertionShadowUpdateIdentifier)
    {
      uint64_t v5 = currentDropInsertionShadowUpdateIdentifier;
      BOOL v6 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
      uint64_t v7 = [(_UICollectionViewShadowUpdatesController *)self _findShadowUpdateForIdentifier:v5 inShadowUpdates:v6];

      if (v7)
      {
        char v8 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
        uint64_t v9 = 64;
        if (!*(void *)(v7 + 80)) {
          uint64_t v9 = 72;
        }
        id v10 = *(id *)(v7 + v9);
        id v11 = *(id *)(v7 + 88);
        char v12 = [v8 finalIndexPathForIndexPath:v10 startingAtUpdateWithIdentifier:v11];

        [(_UICollectionViewDragAndDropController *)self _resetReorderedItems];
        -[_UICollectionViewDragDestinationController dropInsertionRolledBack]((uint64_t)self->_destinationController);
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        long long v18 = __71___UICollectionViewDragAndDropController__rollbackCurrentDropInsertion__block_invoke;
        double v19 = &unk_1E52D9F98;
        id v20 = v3;
        id v21 = v12;
        id v13 = v12;
        id v14 = (id)[v20 _performShadowUpdates:&v16];
        -[_UICollectionViewDragAndDropController setCurrentDropInsertionShadowUpdateIdentifier:]((uint64_t)self);
        uint64_t v15 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
        [v15 removeAllObjects];

        [(_UICollectionViewShadowUpdatesController *)self _regenerateUpdateMap];
      }
    }
  }
}

- (BOOL)rebaseForUpdates:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self _rebasedUpdateMapForUpdates:v4];
    if (v5 && [(_UICollectionViewShadowUpdatesController *)self _rebaseForUpdateMap:v5])
    {
      if (self && self->_rebaseShadowUpdatesOnly)
      {
        BOOL v6 = 1;
      }
      else
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __59___UICollectionViewDragAndDropController_rebaseForUpdates___block_invoke;
        aBlock[3] = &unk_1E52E5E90;
        id v30 = v5;
        id v43 = v30;
        char v8 = (void (**)(void *, void *))_Block_copy(aBlock);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v29 = v5;
        if (self) {
          reorderedItems = self->__reorderedItems;
        }
        else {
          reorderedItems = 0;
        }
        id obj = reorderedItems;
        uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v45 count:16];
        if (v33)
        {
          uint64_t v32 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v39 != v32) {
                objc_enumerationMutation(obj);
              }
              id v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              char v12 = [v11 originalIndexPath];
              id v13 = v8[2](v8, v12);

              if (!v13) {
                goto LABEL_39;
              }
              id v14 = [v11 targetIndexPath];
              uint64_t v15 = v8[2](v8, v14);

              [v11 setOriginalIndexPath:v13];
              if (!v15)
              {
                uint64_t v16 = [v30 finalSnapshot];
                uint64_t v17 = [v11 targetIndexPath];
                int v18 = [v16 indexPathIsSectionAppendingInsert:v17];

                if (!v18
                  || ([v11 targetIndexPath], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
                {

LABEL_39:
                  BOOL v6 = 0;
                  goto LABEL_40;
                }
              }
              [v11 setTargetIndexPath:v15];
            }
            uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v45 count:16];
            if (v33) {
              continue;
            }
            break;
          }
        }

        -[_UICollectionViewDragAndDropController rebaseCellAppearanceStatesForUpdates:]((uint64_t)self, v8);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v28 = self;
        if (self) {
          dropCoordinatorItems = self->_dropCoordinatorItems;
        }
        else {
          dropCoordinatorItems = 0;
        }
        id v20 = dropCoordinatorItems;
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v20);
              }
              long long v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              long long v26 = objc_msgSend(v25, "destinationIndexPath", v28);
              if (v26)
              {
                long long v27 = v8[2](v8, v26);
                if (v27) {
                  [v25 setDestinationIndexPath:v27];
                }
              }
            }
            uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v44 count:16];
          }
          while (v22);
        }

        -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)v28);
        -[_UICollectionViewDragSourceController rebaseForUpdates:](&v28->_sourceController->super.isa, v8);
        -[_UICollectionViewDragDestinationController rebaseForUpdates:](&v28->_destinationController->super.isa, v8);
        BOOL v6 = 1;
LABEL_40:

        uint64_t v5 = v29;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)placeholderContextsByIndexPath
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = (void *)a1[11];
    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v4 = (void *)v1[11];
      v1[11] = v3;

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = (id)v1[12];
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v23;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v23 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
            if (v9) {
              id v10 = *(void **)(v9 + 8);
            }
            else {
              id v10 = 0;
            }
            id v11 = v10;
            char v12 = [v1 _shadowUpdates];
            id v13 = [v1 _findShadowUpdateForIdentifier:v11 inShadowUpdates:v12];

            if (v13)
            {
              uint64_t v14 = v13[10] ? 64 : 72;
              id v15 = *(id *)((char *)v13 + v14);

              if (v15)
              {
                uint64_t v16 = (void *)v1[11];
                if (v13[10]) {
                  uint64_t v17 = 8;
                }
                else {
                  uint64_t v17 = 9;
                }
                id v18 = (id)v13[v17];
                [v16 setObject:v9 forKeyedSubscript:v18];
              }
            }

            ++v8;
          }
          while (v6 != v8);
          uint64_t v19 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          uint64_t v6 = v19;
        }
        while (v19);
      }

      uint64_t v2 = (void *)v1[11];
    }
    a1 = v2;
  }
  return a1;
}

- (void)defaultAnimationHandlers
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[19];
    if (!v3)
    {
      id v4 = objc_alloc_init(_UIDropAnimationHandlers);
      uint64_t v5 = (void *)v2[19];
      v2[19] = v4;

      id v3 = (void *)v2[19];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_updateCellAppearancesForItemsAtIndexPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
        id v11 = [v10 cellForItemAtIndexPath:v9];

        if (v11) {
          -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)self, v11, v9);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (BOOL)_removeMoveShadowUpdateMatchingReorderedItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v20 = self;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      uint64_t v21 = v8;
      uint64_t v22 = v7 + v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        if ([v11 updateAction] == 3)
        {
          long long v12 = [v11 indexPathBeforeUpdate];
          long long v13 = [v4 originalIndexPath];
          if ([v12 isEqual:v13])
          {
            long long v14 = [v11 indexPathAfterUpdate];
            long long v15 = [v4 targetIndexPath];
            int v16 = [v14 isEqual:v15];

            if (v16)
            {
              uint64_t v17 = [(_UICollectionViewShadowUpdatesController *)v20 _shadowUpdates];
              [v17 removeObjectAtIndex:v21 + v10];

              BOOL v18 = 1;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v8 = v22;
    }
    while (v7);
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (id)_shadowUpdateReuseIdentifierForItemItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[_UICollectionViewDragAndDropController placeholderContextsByIndexPath](self);
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = (_UICollectionViewPlaceholderContext *)v6[2];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_12;
  }
  if (self)
  {
    uint64_t v9 = self->_currentlyInsertingPlaceholderContext;
    if (v9)
    {
      uint64_t v10 = v9;
      currentlyInsertingPlaceholderContext = self->_currentlyInsertingPlaceholderContext;
      long long v12 = currentlyInsertingPlaceholderContext
          ? currentlyInsertingPlaceholderContext->_originalInsertionIndexPath
          : 0;
      long long v13 = currentlyInsertingPlaceholderContext;
      int v14 = [(NSIndexPath *)v12 isEqual:v4];

      if (v14)
      {
        uint64_t v7 = self->_currentlyInsertingPlaceholderContext;
        if (v7) {
          uint64_t v7 = (_UICollectionViewPlaceholderContext *)v7->_reuseIdentifier;
        }
        goto LABEL_3;
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)_UICollectionViewDragAndDropController;
  uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)&v17 _shadowUpdateReuseIdentifierForItemItemAtIndexPath:v4];
LABEL_12:
  long long v15 = v8;

  return v15;
}

- (void)_updateCellIfNeeded:(id)a3 atIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13 && v6)
  {
    if (self)
    {
      currentlyInsertingPlaceholderContext = self->_currentlyInsertingPlaceholderContext;
      if (currentlyInsertingPlaceholderContext)
      {
        uint64_t v8 = currentlyInsertingPlaceholderContext;
        int v9 = [v8[3] isEqual:v6];

        if (v9)
        {
          uint64_t v10 = self->_currentlyInsertingPlaceholderContext;
          if (v10) {
            goto LABEL_16;
          }
        }
      }
    }
    id v11 = -[_UICollectionViewDragAndDropController placeholderContextsByIndexPath](self);
    uint64_t v10 = [v11 objectForKeyedSubscript:v6];

    if (v10)
    {
LABEL_16:
      cellUpdateHandler = (void (**)(id, id))v10->_cellUpdateHandler;
      if (cellUpdateHandler) {
        cellUpdateHandler[2](cellUpdateHandler, v13);
      }
    }
  }
}

- (BOOL)_deleteShadowUpdateWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  id v6 = [(_UICollectionViewShadowUpdatesController *)self _findShadowUpdateForIdentifier:v4 inShadowUpdates:v5];

  if (v6
    && ([(_UICollectionViewShadowUpdatesController *)self _shadowUpdates],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 indexOfObjectIdenticalTo:v6],
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v10 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    [v10 removeObjectAtIndex:v8];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_cellAppearanceStateForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v4];
  if (v5)
  {
    if (self) {
      cellAppearanceStatesByIndexPaths = self->_cellAppearanceStatesByIndexPaths;
    }
    else {
      cellAppearanceStatesByIndexPaths = 0;
    }
    uint64_t v7 = [(NSMutableDictionary *)cellAppearanceStatesByIndexPaths objectForKeyedSubscript:v4];
    if (!v7)
    {
      uint64_t v7 = objc_alloc_init(_UICollectionViewCellAppearanceState);
      if (self) {
        uint64_t v8 = self->_cellAppearanceStatesByIndexPaths;
      }
      else {
        uint64_t v8 = 0;
      }
      [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v4];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_addDropCoordinatorItem:(id)a3
{
  id v3 = self;
  if (self) {
    self = (_UICollectionViewDragAndDropController *)self->_dropCoordinatorItems;
  }
  [(_UICollectionViewDragAndDropController *)self addObject:a3];
  -[_UICollectionViewDragAndDropController setDropCoordinatorItemsMap:]((uint64_t)v3);
}

- (id)_presentationIndexPathForIndexPath:(id)a3 allowingAppendingInserts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v6];
  if (!v7 && v4)
  {
    uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    BOOL v9 = [v8 initialSnapshot];
    int v10 = [v9 indexPathIsSectionAppendingInsert:v6];

    if (v10)
    {
      id v11 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
      long long v12 = [v11 finalSnapshot];
      uint64_t v7 = objc_msgSend(v12, "indexPathForAppendingInsertInSection:", objc_msgSend(v6, "section"));

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (void)_addAnimationHandlers:(id)a3 toAnimator:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v5 alongsideAnimationHandlers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addAnimations:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v12 = objc_msgSend(v5, "completionHandlers", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [v6 addCompletion:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)_invokeAllCompletionHandlers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  if (self) {
    dropCoordinatorItems = self->_dropCoordinatorItems;
  }
  else {
    dropCoordinatorItems = 0;
  }
  BOOL v4 = dropCoordinatorItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v24 + 1) + 8 * i) animationHandlers];
        [v9 invokeAllCompletionHandlers];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (self) {
    placeholderContexts = self->_placeholderContexts;
  }
  else {
    placeholderContexts = 0;
  }
  uint64_t v11 = placeholderContexts;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        if (v16) {
          long long v17 = *(void **)(v16 + 40);
        }
        else {
          long long v17 = 0;
        }
        objc_msgSend(v17, "invokeAllCompletionHandlers", (void)v20);
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      uint64_t v13 = v18;
    }
    while (v18);
  }

  long long v19 = -[_UICollectionViewDragAndDropController defaultAnimationHandlers](self);
  [v19 invokeAllCompletionHandlers];
}

- (void)_resetAllAnimationHandlers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  if (self) {
    dropCoordinatorItems = self->_dropCoordinatorItems;
  }
  else {
    dropCoordinatorItems = 0;
  }
  BOOL v4 = dropCoordinatorItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v24 + 1) + 8 * i) animationHandlers];
        [v9 resetAllAnimationHandlers];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (self) {
    placeholderContexts = self->_placeholderContexts;
  }
  else {
    placeholderContexts = 0;
  }
  uint64_t v11 = placeholderContexts;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        if (v16) {
          long long v17 = *(void **)(v16 + 40);
        }
        else {
          long long v17 = 0;
        }
        objc_msgSend(v17, "resetAllAnimationHandlers", (void)v20);
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      uint64_t v13 = v18;
    }
    while (v18);
  }

  long long v19 = -[_UICollectionViewDragAndDropController defaultAnimationHandlers](self);
  [v19 resetAllAnimationHandlers];
}

- (void)dragSourceController:(void *)a3 willBeginLiftForItemsAtIndexPaths:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1)
  {
    [a1 _incrementSessionRefCount];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v11, (void)v14);
          uint64_t v12 = (unsigned char *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = v12;
          if (v12 && !v12[8])
          {
            [v12 setDragState:1];
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [a1 _updateCellAppearancesForItemsAtIndexPaths:v5];
  }
}

- (void)dragSourceController:(void *)a3 didCompleteLiftForItemsAtIndexPaths:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v11, (void)v14);
          uint64_t v12 = (unsigned char *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = v12;
          if (v12 && !v12[8])
          {
            [v12 setDragState:3];
            [v13 setHasLifted:1];
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [a1 _updateCellAppearancesForItemsAtIndexPaths:v5];
    [a1 _decrementSessionRefCount];
  }
}

- (void)dragSourceController:(void *)a3 didCancelLiftForItemsAtIndexPaths:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v11, (void)v14);
          uint64_t v13 = v12;
          if (v12)
          {
            [v12 setDragState:8];
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [a1 _updateCellAppearancesForItemsAtIndexPaths:v5];
    [a1 _decrementSessionRefCount];
  }
}

- (void)dragSourceController:(void *)a3 didUpdateItemsAtIndexPaths:
{
  id v4 = a3;
  if (a1)
  {
    id v6 = v4;
    if ([a1 isDragDestinationInteractivelyReordering])
    {
      uint64_t v5 = [v6 count];
      if (v5 >= 2) {
        -[_UICollectionViewDragDestinationController dragSourceSelectedItemCountDidChangeWithCount:](a1[6], v5);
      }
    }
    [a1 _updateCellAppearancesForItemsAtIndexPaths:v6];
    id v4 = v6;
  }
}

- (void)dragSourceController:(id *)a1 didEndForItemsAtIndexPaths:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a1[14], "keyEnumerator", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
      uint64_t v9 = [a1[14] objectForKeyedSubscript:v8];
      uint64_t v10 = v9;
      if (!v9) {
        goto LABEL_14;
      }
      if ([v9 dragState] != 4
        && [v10 dragState] != 5
        && [v10 dragState] != 7
        && [v10 dragState] != 6
        && [v10 dragState] != 8)
      {
        [v10 setDragState:8];
LABEL_14:
        [v2 addObject:v8];
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v5);
LABEL_17:

  if ([v2 count]) {
    [a1 _updateCellAppearancesForItemsAtIndexPaths:v2];
  }
  [a1 _decrementSessionRefCount];
}

- (void)dragSourceController:(void *)a1 didSupplyCancellationPreviewForItemAtIndexPath:
{
  if (a1)
  {
    uint64_t v1 = objc_msgSend(a1, "_cellAppearanceStateForIndexPath:");
    if (v1)
    {
      id v2 = v1;
      [v1 setHasBeganCancelling:1];
      uint64_t v1 = v2;
    }
  }
}

- (void)dragSourceController:(void *)a3 willBeginAnimatingCancelForItemsAtIndexPaths:(void *)a4 withAnimator:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v6 = a4;
  if (!a1) {
    goto LABEL_25;
  }
  [a1 _incrementSessionRefCount];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v8 = [a1[14] keyEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v9) {
    goto LABEL_13;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
      long long v14 = [a1[14] objectForKeyedSubscript:v13];
      long long v15 = v14;
      if (v14)
      {
        if (v14[9]) {
          goto LABEL_11;
        }
        [v14 setDragState:7];
      }
      [v7 addObject:v13];
LABEL_11:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v10);
LABEL_13:

  if ([v7 count])
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke;
    v34[3] = &unk_1E52D9F98;
    v34[4] = a1;
    id v35 = v7;
    [v6 addAnimations:v34];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v24;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = [a1 _cellAppearanceStateForIndexPath:*(void *)(*((void *)&v30 + 1) + 8 * j)];
        long long v22 = v21;
        if (v21) {
          [v21 setDragState:6];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v18);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_2;
  v28[3] = &unk_1E52D9F98;
  v28[4] = a1;
  id v23 = v16;
  id v29 = v23;
  [v6 addAnimations:v28];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_3;
  v25[3] = &unk_1E52E6608;
  id v26 = v23;
  long long v27 = a1;
  [v6 addCompletion:v25];

LABEL_25:
}

- (void)dragDestinationController:(void *)a3 willBeginDropAnimationForDragItem:(void *)a4 animator:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (a1)
  {
    [a1 _incrementSessionRefCount];
    uint64_t v8 = [a1 _dropCoordinatorItemForDragItem:v6];
    uint64_t v9 = v8;
    if (!v8)
    {
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v10 = [v8 destinationIndexPath];
    if (!v10)
    {
LABEL_13:
      uint64_t v17 = [v9 animationHandlers];
      [a1 _addAnimationHandlers:v17 toAnimator:v7];

      uint64_t v18 = [v9 animationHandlers];
      [v18 resetAllAnimationHandlers];

      id v19 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v20 = a1[12];
      long long v21 = (id *)[v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v21)
      {
        id v26 = v10;
        id v27 = v7;
        uint64_t v22 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v21; uint64_t i = (id *)((char *)i + 1))
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            objc_msgSend(v24, "dragItem", v26, v27, (void)v28);
            id v25 = (id)objc_claimAutoreleasedReturnValue();

            if (v25 == v19)
            {
              long long v21 = v24;
              goto LABEL_23;
            }
          }
          long long v21 = (id *)[v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v21) {
            continue;
          }
          break;
        }
LABEL_23:
        uint64_t v10 = v26;
        id v7 = v27;
      }

      if (v21)
      {
        [a1 _addAnimationHandlers:v21[5] toAnimator:v7];
        [v21[5] resetAllAnimationHandlers];
      }

      goto LABEL_27;
    }
    uint64_t v11 = [a1 indexPathBeforeShadowUpdates:v10];
    if (v11)
    {
      long long v12 = [a1 _cellAppearanceStateForIndexPath:v10];
      uint64_t v13 = v12;
      if (!v12 || [v12 dragState] == 5) {
        goto LABEL_12;
      }
      [v13 setDragState:4];
      long long v32 = v10;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      [a1 _updateCellAppearancesForItemsAtIndexPaths:v14];
    }
    else
    {
      long long v15 = [a1 collectionView];
      uint64_t v13 = [v15 _cellForItemAtIndexPath:v10];

      id v16 = [a1 _cellAppearanceStateForIndexPath:v10];
      long long v14 = v16;
      if (v16) {
        [v16 setDragState:4];
      }
      -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)a1, v13, v10);
    }

LABEL_12:
    goto LABEL_13;
  }
LABEL_28:
}

- (void)dragDestinationController:(void *)a1 didCompleteDropAnimationForDragItem:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_msgSend(a1, "_dropCoordinatorItemForDragItem:");
    id v3 = v2;
    if (v2)
    {
      uint64_t v4 = [v2 destinationIndexPath];
      if (v4)
      {
        uint64_t v5 = [a1 indexPathBeforeShadowUpdates:v4];
        if (v5)
        {
          id v6 = [a1 _cellAppearanceStateForIndexPath:v4];
          id v7 = v6;
          if (v6) {
            [v6 setDragState:7];
          }

          v12[0] = v4;
          uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
          [a1 _updateCellAppearancesForItemsAtIndexPaths:v8];
        }
        else
        {
          uint64_t v9 = [a1 collectionView];
          uint64_t v8 = [v9 _cellForItemAtIndexPath:v4];

          uint64_t v10 = [a1 _cellAppearanceStateForIndexPath:v4];
          uint64_t v11 = v10;
          if (v10) {
            [v10 setDragState:7];
          }
          -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)a1, v8, v4);
        }
      }
    }
    [a1 _decrementSessionRefCount];
  }
}

- (void)dragDestinationControllerSessionDidEnter:(int)a3 isNewSession:(int)a4 isResuming:
{
  long long v12 = a2;
  if (a1)
  {
    if ((a3 & 1) != 0 || a4)
    {
      id v7 = &OBJC_IVAR___UITab__hiddenByDefault;
      if ((a4 & 1) == 0 && a1[8])
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = [a1 collectionView];
        [v10 handleFailureInMethod:sel_dragDestinationControllerSessionDidEnter_isNewSession_isResuming_, a1, @"_UICollectionViewDragAndDropController.m", 1254, @"UICollectionView internal inconsistency: attempted to enter new reordering session whilst an existing session was active. Collection view: %@", v11 object file lineNumber description];

        id v7 = &OBJC_IVAR___UITab__hiddenByDefault;
      }
      BOOL v8 = -[_UICollectionViewDragDestinationController supportsLocalSessionReordering](v12);
      uint64_t v9 = 2;
      if (!v8) {
        uint64_t v9 = 3;
      }
      *(void *)((char *)a1 + v7[283]) = v9;
      if (a3) {
        [a1 _incrementSessionRefCount];
      }
    }
    [a1 _updatePreferredDraggedCellAppearanceForSessionUpdate];
  }
}

- (NSIndexPath)destinationIndexPath
{
  p_isa = &self->_destinationController->super.isa;
  if (p_isa)
  {
    p_isa = -[_UICollectionViewDragDestinationController currentIndexPath](p_isa);
  }
  return (NSIndexPath *)p_isa;
}

- (id)sourceIndexPaths
{
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 56);
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
    if (v1)
    {
      id v3 = -[_UICollectionViewDragSourceController dragFromIndexPaths](v1);
      uint64_t v4 = (void *)[v3 copy];
    }
    else
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = v2;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (int64_t)numberOfSections
{
  id v2 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
  id v3 = [v2 finalSnapshot];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  int64_t v4 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
  uint64_t v5 = [v4 finalSnapshot];
  int64_t v6 = [v5 numberOfItemsInSection:a3];

  return v6;
}

- (id)insertPlaceholderForItemAtIndexPath:(id)a3 forDragItem:(id)a4 reuseIdentifier:(id)a5 cellUpdateHandler:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_UICollectionViewDragAndDropController.m", 1313, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  long long v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"_UICollectionViewDragAndDropController.m", 1314, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];

LABEL_3:
  id v16 = [_UICollectionViewPlaceholderContext alloc];
  id v17 = v12;
  id v18 = v13;
  id v19 = v14;
  id v20 = self;
  id v21 = v15;
  if (v16)
  {
    v42.receiver = v16;
    v42.super_class = (Class)_UICollectionViewPlaceholderContext;
    uint64_t v22 = [(_UICollectionViewDragAndDropController *)&v42 init];
    if (v22)
    {
      uint64_t v23 = [v21 copy];
      shadowUpdates = v22->super.__shadowUpdates;
      v22->super.__shadowUpdates = (NSMutableArray *)v23;

      objc_storeStrong((id *)&v22->super._updateMap, a3);
      objc_storeStrong((id *)&v22->_sourceController, a4);
      objc_storeStrong((id *)&v22->super._initialSnapshot, a5);
      objc_storeWeak((id *)&v22->_destinationController, v20);
      id v25 = objc_alloc_init(_UIDropAnimationHandlers);
      id v26 = *(void **)&v22->_dragInteractionEnabled;
      *(void *)&v22->_dragInteractionEnabled = v25;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  if (v20) {
    placeholderContexts = v20->_placeholderContexts;
  }
  else {
    placeholderContexts = 0;
  }
  [(NSMutableSet *)placeholderContexts addObject:v22];
  long long v28 = [(_UICollectionViewShadowUpdatesController *)v20 collectionView];
  -[_UICollectionViewDragAndDropController setCurrentlyInsertingPlaceholderContext:]((uint64_t)v20, v22);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __124___UICollectionViewDragAndDropController_insertPlaceholderForItemAtIndexPath_forDragItem_reuseIdentifier_cellUpdateHandler___block_invoke;
  v39[3] = &unk_1E52D9F98;
  id v40 = v28;
  id v41 = v17;
  id v29 = v17;
  id v30 = v28;
  long long v31 = [v30 _performShadowUpdates:v39];
  -[_UICollectionViewDragAndDropController setCurrentlyInsertingPlaceholderContext:]((uint64_t)v20, 0);
  -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)v20);
  uint64_t v32 = [v31 firstObject];
  long long v33 = (void *)v32;
  if (v32) {
    uint64_t v34 = *(void **)(v32 + 88);
  }
  else {
    uint64_t v34 = 0;
  }
  id v35 = v34;
  if (v22) {
    objc_storeStrong((id *)&v22->super._collectionView, v34);
  }

  return v22;
}

- (void)setCurrentlyInsertingPlaceholderContext:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (id)placeholderContextDidDismiss:(id)a3
{
  int64_t v4 = a3;
  if (self)
  {
    if (![(NSMutableSet *)self->_placeholderContexts containsObject:v4])
    {
      id v16 = 0;
      goto LABEL_15;
    }
    placeholderContexts = self->_placeholderContexts;
  }
  else
  {
    char v25 = [0 containsObject:v4];
    placeholderContexts = 0;
    id v16 = 0;
    if ((v25 & 1) == 0) {
      goto LABEL_15;
    }
  }
  [(NSMutableSet *)placeholderContexts removeObject:v4];
  -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)self);
  if (v4) {
    int64_t v6 = (void *)v4[1];
  }
  else {
    int64_t v6 = 0;
  }
  id v7 = v6;
  BOOL v8 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  uint64_t v9 = [(_UICollectionViewShadowUpdatesController *)self _findShadowUpdateForIdentifier:v7 inShadowUpdates:v8];

  if (v9)
  {
    uint64_t v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    uint64_t v12 = 64;
    if (!*(void *)(v9 + 80)) {
      uint64_t v12 = 72;
    }
    id v13 = *(id *)(v9 + v12);
    id v14 = *(id *)(v9 + 88);
    id v15 = [v11 finalIndexPathForIndexPath:v13 startingAtUpdateWithIdentifier:v14];

    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    long long v28 = __71___UICollectionViewDragAndDropController_placeholderContextDidDismiss___block_invoke;
    id v29 = &unk_1E52D9F98;
    id v30 = v10;
    id v16 = v15;
    id v31 = v16;
    id v17 = v10;
    id v18 = [v17 _performShadowUpdates:&v26];
    uint64_t v19 = objc_msgSend(v18, "firstObject", v26, v27, v28, v29);
    id v20 = (void *)v19;
    if (v19) {
      id v21 = *(void **)(v19 + 88);
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;
    [(_UICollectionViewDragAndDropController *)self _deleteShadowUpdateWithIdentifier:v22];

    [(_UICollectionViewShadowUpdatesController *)self _regenerateUpdateMap];
    id v23 = *(id *)(v9 + 88);
    [(_UICollectionViewShadowUpdatesController *)self _pruneAndRebaseShadowUpdatesForShadowInsertWithIdentifier:v23];

    [(_UICollectionViewShadowUpdatesController *)self _regenerateUpdateMap];
  }
  else
  {
    id v16 = 0;
  }

LABEL_15:
  return v16;
}

- (void)placeholderContextNeedsCellUpdate:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  if (self) {
    placeholderContexts = self->_placeholderContexts;
  }
  else {
    placeholderContexts = 0;
  }
  if ([(NSMutableSet *)placeholderContexts containsObject:v5])
  {
    if (v5) {
      id v7 = (void *)v5[1];
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    uint64_t v9 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    uint64_t v10 = [(_UICollectionViewShadowUpdatesController *)self _findShadowUpdateForIdentifier:v8 inShadowUpdates:v9];

    if (!v10) {
      goto LABEL_25;
    }
    uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v12 = 8;
    if (!v10[10]) {
      uint64_t v12 = 9;
    }
    id v13 = (id)v10[v12];
    id v14 = [v11 _cellForItemAtIndexPath:v13];

    if (v14)
    {
      int v15 = dyld_program_sdk_at_least();
      id v16 = [v14 reuseIdentifier];
      id v17 = v16;
      if (v15)
      {
        if (v5) {
          uint64_t v18 = v5[2];
        }
        else {
          uint64_t v18 = 0;
        }
        char v19 = [v16 isEqualToString:v18];

        if ((v19 & 1) == 0)
        {
          id v20 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v21 = [v14 reuseIdentifier];
          id v22 = (void *)v21;
          if (v5) {
            uint64_t v23 = v5[2];
          }
          else {
            uint64_t v23 = 0;
          }
          [v20 handleFailureInMethod:a2, self, @"_UICollectionViewDragAndDropController.m", 1384, @"Error: cell reuseIdentifier (%@) does not match expected placeholder context reuseIdentifier (%@). Please file a bug against UICollectionView.", v21, v23 object file lineNumber description];

          if (!v5) {
            goto LABEL_24;
          }
          goto LABEL_22;
        }
      }
      else
      {
        if (v5) {
          uint64_t v24 = v5[2];
        }
        else {
          uint64_t v24 = 0;
        }
        char v25 = [v16 isEqualToString:v24];

        if ((v25 & 1) == 0)
        {
          uint64_t v27 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &placeholderContextNeedsCellUpdate____s_category)+ 8);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = [v14 reuseIdentifier];
            id v29 = (void *)v28;
            if (v5) {
              uint64_t v30 = v5[2];
            }
            else {
              uint64_t v30 = 0;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v32 = v28;
            __int16 v33 = 2112;
            uint64_t v34 = v30;
            _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Error: cell reuseIdentifier (%@) does not match expected placeholder context reuseIdentifier (%@). Please file a bug against UICollectionView.", buf, 0x16u);
          }
          if (!v5) {
            goto LABEL_24;
          }
          goto LABEL_22;
        }
      }
      if (v5)
      {
LABEL_22:
        uint64_t v26 = v5[4];
        if (v26) {
          (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v14);
        }
      }
    }
LABEL_24:

LABEL_25:
  }
}

- (BOOL)placeholderContext:(id)a3 didCommitInsertionWithDataSourceUpdates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self) {
    placeholderContexts = self->_placeholderContexts;
  }
  else {
    placeholderContexts = 0;
  }
  int v10 = [(NSMutableSet *)placeholderContexts containsObject:v7];
  if (v10)
  {
    [(_UICollectionViewDragAndDropController *)self placeholderContextNeedsCellUpdate:v7];
    if (v7) {
      uint64_t v11 = (void *)v7[1];
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;
    id v13 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    id v14 = [(_UICollectionViewShadowUpdatesController *)self _findShadowUpdateForIdentifier:v12 inShadowUpdates:v13];

    int v15 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    id v16 = -[UICollectionViewUpdateItem _indexPath](v14);
    if (v14) {
      id v17 = (void *)v14[11];
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    char v19 = [v15 initialIndexPathForIndexPath:v16 beforeUpdateWithIdentifier:v18];

    if (!v19)
    {
      id v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1401 description:@"UICollectionView internal inconsistency exception: could not locate placeholder insertion location; this should never be nil."];
    }
    uint64_t v30 = v8;
    id v20 = [(_UICollectionViewDragAndDropController *)self placeholderContextDidDismiss:v7];
    uint64_t v21 = [[UICollectionViewUpdateItem alloc] initWithAction:0 forIndexPath:v20];
    id v22 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v23 = v22;
    if (self)
    {
      BOOL rebaseShadowUpdatesOnly = self->_rebaseShadowUpdatesOnly;
      self->_BOOL rebaseShadowUpdatesOnly = 1;
    }
    else
    {
      BOOL rebaseShadowUpdatesOnly = 0;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke;
    v31[3] = &unk_1E52E65E0;
    id v32 = v22;
    id v33 = v19;
    uint64_t v34 = v21;
    id v35 = v30;
    char v25 = v21;
    id v26 = v19;
    id v27 = v23;
    [v27 _performInternalBatchUpdates:v31];
    if (self) {
      self->_BOOL rebaseShadowUpdatesOnly = rebaseShadowUpdatesOnly;
    }

    id v8 = v30;
  }

  return v10;
}

- (void)_performCancelDropToIndexPath:(void *)a3 forDragItem:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = [[_UICollectionViewDropCoordinatorItem alloc] initWithDestinationIndexPath:v6 dragItem:v5];

    [(_UICollectionViewDropCoordinatorItem *)v7 setShouldRemainInHierarchy:1];
    [a1 _addDropCoordinatorItem:v7];
  }
}

- (NSArray)items
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int64_t v4 = -[_UICollectionViewDragDestinationController currentDropSession](&self->_destinationController->super.isa);
  id v5 = [v4 items];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = -[_UICollectionViewDragSourceController indexPathForDragItem:]((id *)&self->_sourceController->super.isa, v10);
        id v12 = [_UICollectionViewDropItem alloc];
        [v10 _visibleDropItemSize];
        id v13 = -[_UICollectionViewDropItem initWithDragItem:previewSize:sourceIndexPath:](v12, "initWithDragItem:previewSize:sourceIndexPath:", v10, v11);
        [v3 addObject:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)dropItem:(id)a3 toPlaceholderInsertedAtIndexPath:(id)a4 withReuseIdentifier:(id)a5 cellUpdateHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1457 description:@"Please pass an object of type UIDragItem."];
  }
  int v15 = [(UICollectionViewPlaceholder *)[UICollectionViewDropPlaceholder alloc] initWithInsertionIndexPath:v14 reuseIdentifier:v13];

  [(UICollectionViewPlaceholder *)v15 setCellUpdateHandler:v12];
  long long v16 = [(_UICollectionViewDragAndDropController *)self dropItem:v11 toPlaceholder:v15];

  return v16;
}

- (id)dropItem:(id)a3 toPlaceholder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1465 description:@"Please pass an object of type UIDragItem."];
  }
  uint64_t v9 = [v8 insertionIndexPath];
  int v10 = [(_UICollectionViewDragAndDropController *)self _presentationIndexPathForIndexPath:v9 allowingAppendingInserts:1];

  id v11 = [[_UICollectionViewDropCoordinatorItem alloc] initWithDestinationIndexPath:v10 dragItem:v7 placeholderConfiguration:v8];
  [(_UICollectionViewDragAndDropController *)self _addDropCoordinatorItem:v11];
  id v12 = [v8 cellReuseIdentifier];
  id v13 = [v8 cellUpdateHandler];

  id v14 = [(_UICollectionViewDragAndDropController *)self insertPlaceholderForItemAtIndexPath:v10 forDragItem:v7 reuseIdentifier:v12 cellUpdateHandler:v13];

  return v14;
}

- (id)dropItem:(id)a3 toItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1477 description:@"Please pass an object of type UIDragItem."];
  }
  uint64_t v9 = [(_UICollectionViewDragAndDropController *)self _presentationIndexPathForIndexPath:v8 allowingAppendingInserts:1];
  int v10 = [[_UICollectionViewDropCoordinatorItem alloc] initWithDestinationIndexPath:v9 dragItem:v7];
  [(_UICollectionViewDragAndDropController *)self _addDropCoordinatorItem:v10];

  return v10;
}

- (id)dropItem:(id)a3 intoItemAtIndexPath:(id)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1486 description:@"Please pass an object of type UIDragItem."];
  }
  id v14 = [(_UICollectionViewDragAndDropController *)self _presentationIndexPathForIndexPath:v13 allowingAppendingInserts:1];
  int v15 = -[_UICollectionViewDragAndDropController defaultAnimationHandlers](self);
  long long v16 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  long long v17 = [v16 _cellForItemAtIndexPath:v14];

  if (v17)
  {
    [v12 _visibleDropItemSize];
    double v19 = v18;
    double v21 = v20;
    if (!UIRectIsDiscrete(x, y, width, height))
    {
      [v17 bounds];
      double x = v22;
      double y = v23;
      double width = v24;
      double height = v25;
    }
    double v26 = x + width * 0.5;
    double v27 = y + height * 0.5;
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v38.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v38.c = v28;
    *(_OWORD *)&v38.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v19 == *MEMORY[0x1E4F1DB30] && v21 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      CGAffineTransformMakeScale(&v38, 0.01, 0.01);
    }
    else {
      _UIScaleTransformForAspectFitOrFillOfSizeInTargetSize((CGAffineTransform *)1, (uint64_t)&v38, v19, v21, width, height);
    }
    uint64_t v30 = [UIDragPreviewTarget alloc];
    CGAffineTransform v37 = v38;
    id v31 = -[UIPreviewTarget initWithContainer:center:transform:](v30, "initWithContainer:center:transform:", v17, &v37, v26, v27);
    id v32 = [[_UICollectionViewDropCoordinatorItem alloc] initWithDragItem:v12 target:v31];
    [(_UICollectionViewDropCoordinatorItem *)v32 setDestinationIndexPath:v14];
    [(_UICollectionViewDropCoordinatorItem *)v32 setShouldRemainInHierarchy:1];
    [(_UICollectionViewDragAndDropController *)self _addDropCoordinatorItem:v32];

    id v33 = [(_UICollectionViewDragAndDropController *)self _cellAppearanceStateForIndexPath:v14];
    uint64_t v34 = v33;
    if (v33) {
      [v33 setDragState:5];
    }

    int v15 = v32;
  }

  return v15;
}

- (id)dropItem:(id)a3 toTarget:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1519 description:@"Please pass an object of type UIDragItem."];
  }
  uint64_t v9 = [[_UICollectionViewDropCoordinatorItem alloc] initWithDragItem:v7 target:v8];

  [(_UICollectionViewDragAndDropController *)self _addDropCoordinatorItem:v9];
  return v9;
}

- (void)dropToItemAtIndexPath:(id)a3 forDragItem:(id)a4
{
  id v4 = [(_UICollectionViewDragAndDropController *)self dropItem:a4 toItemAtIndexPath:a3];
}

- (id)dropToPlaceholderCellAtIndexPath:(id)a3 reuseIdentifier:(id)a4 forDragItem:(id)a5 cellUpdateHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1532 description:@"Please pass an object of type UIDragItem."];
  }
  int v15 = [(_UICollectionViewDragAndDropController *)self dropItem:v13 toPlaceholderInsertedAtIndexPath:v11 withReuseIdentifier:v12 cellUpdateHandler:v14];

  return v15;
}

- (id)dropToPlaceholderInsertedAtIndexPath:(id)a3 reuseIdentifier:(id)a4 forDragItem:(id)a5 cellUpdateHandler:(id)a6
{
  return [(_UICollectionViewDragAndDropController *)self dropItem:a5 toPlaceholderInsertedAtIndexPath:a3 withReuseIdentifier:a4 cellUpdateHandler:a6];
}

- (void)dropToLocation:(CGPoint)a3 inContainerView:(id)a4 withTransform:(CGAffineTransform *)a5 forDragItem:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v12 = a6;
  id v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UICollectionViewDragAndDropController.m" lineNumber:1545 description:@"Please pass an object of type UIDragItem."];
  }
  id v14 = [UIDragPreviewTarget alloc];
  long long v15 = *(_OWORD *)&a5->c;
  v19[0] = *(_OWORD *)&a5->a;
  v19[1] = v15;
  v19[2] = *(_OWORD *)&a5->tx;
  long long v16 = -[UIPreviewTarget initWithContainer:center:transform:](v14, "initWithContainer:center:transform:", v13, v19, x, y);

  id v17 = [(_UICollectionViewDragAndDropController *)self dropItem:v12 toTarget:v16];
}

- (void)dropToTarget:(id)a3 forDragItem:(id)a4
{
  id v4 = [(_UICollectionViewDragAndDropController *)self dropItem:a4 toTarget:a3];
}

- (UICollectionViewDropProposal)proposal
{
  return (UICollectionViewDropProposal *)-[_UICollectionViewDragDestinationController currentDropProposal](&self->_destinationController->super.isa);
}

- (UIDropSession)session
{
  return (UIDropSession *)-[_UICollectionViewDragDestinationController currentDropSession](&self->_destinationController->super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reorderedItems, 0);
  objc_storeStrong((id *)&self->_currentDropInsertionShadowUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultAnimationHandlers, 0);
  objc_storeStrong((id *)&self->_cellsDeferredForReuse, 0);
  objc_storeStrong((id *)&self->_dropCoordinatorItemsMap, 0);
  objc_storeStrong((id *)&self->_dropCoordinatorItems, 0);
  objc_storeStrong((id *)&self->_cellAppearanceStatesByIndexPaths, 0);
  objc_storeStrong((id *)&self->_viewsWithAppearanceUpdates, 0);
  objc_storeStrong((id *)&self->_placeholderContexts, 0);
  objc_storeStrong((id *)&self->_placeholderContextsByIndexPath, 0);
  objc_storeStrong((id *)&self->_currentlyInsertingPlaceholderContext, 0);
  objc_storeStrong((id *)&self->_sourceController, 0);
  objc_storeStrong((id *)&self->_destinationController, 0);
}

@end