@interface TabDragDropInteractionController
+ (BOOL)canDelegateDragDropForTabCollectionView:(id)a3;
- (BOOL)_canOpenInCurrentTabForSession:(id)a3 tabView:(id)a4;
- (BOOL)_placeholderMoveSatisfiesDelay;
- (BOOL)_shouldMovePlaceholderItem:(id)a3 overTargetItem:(id)a4 withDropLocation:(CGPoint)a5 interaction:(id)a6;
- (BOOL)_tabViewIsFilteringTabs:(id)a3;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (TabDocumentDropHandler)dropHandler;
- (TabDragDropDataSource)dataSource;
- (TabDragDropInteractionController)initWithDataSource:(id)a3 dropHandler:(id)a4;
- (id)_autoscrollerForInteraction:(id)a3;
- (id)_insertPlaceholderIfNeededForSession:(id)a3 interaction:(id)a4;
- (id)_newDragItemsAtPoint:(CGPoint)a3 excludingTabUUIDs:(id)a4 interaction:(id)a5 session:(id)a6;
- (id)_tabCollectionItemAtPoint:(CGPoint)a3 interaction:(id)a4;
- (id)_viewForTransitionToItem:(id)a3 withTabCollectionView:(id)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)_cleanUpDragPreviewForSesssion:(id)a3;
- (void)_cleanUpDropPlaceholderForSession:(id)a3 interaction:(id)a4;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)_transitionToDragState:(int64_t)a3 fromDragState:(int64_t)a4 forTabCollectionItemsInSession:(id)a5 interaction:(id)a6;
- (void)_unhideTabsForLocalDragSession:(id)a3;
- (void)_updatePreviewsForInteraction:(id)a3 session:(id)a4 pinned:(BOOL)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
@end

@implementation TabDragDropInteractionController

- (TabDragDropInteractionController)initWithDataSource:(id)a3 dropHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TabDragDropInteractionController;
  v8 = [(TabDragDropInteractionController *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_dropHandler, a4);
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    sessionToPlaceholderItemMap = v9->_sessionToPlaceholderItemMap;
    v9->_sessionToPlaceholderItemMap = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    insertedTabsForDragItems = v9->_insertedTabsForDragItems;
    v9->_insertedTabsForDragItems = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    hasHiddenDocumentsForDragSessions = v9->_hasHiddenDocumentsForDragSessions;
    v9->_hasHiddenDocumentsForDragSessions = (NSMapTable *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    tabViewsPendingActivation = v9->_tabViewsPendingActivation;
    v9->_tabViewsPendingActivation = (NSMutableSet *)v16;

    v18 = v9;
  }

  return v9;
}

+ (BOOL)canDelegateDragDropForTabCollectionView:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  id v6 = tabViewFromInteraction(a3);
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 hidesInactiveTabs]) {
    char v7 = [MEMORY[0x1E4F78598] canCreateNavigationIntentForDropSession:v5];
  }
  else {
    char v7 = +[TabDocumentDropHandler canHandleSession:v5];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  tabViewFromInteraction(v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector())
  {
    BOOL v8 = [v13 searchController];
    if ([v8 isSearching])
    {
      v9 = [v8 searchTerm];
      uint64_t v10 = [v9 length];

      if (!v10) {
        [v8 endSearching];
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained didBeginTrackingSession:v6];

  uint64_t v12 = [(TabDragDropInteractionController *)self _autoscrollerForInteraction:v7];

  [v12 beginInteraction];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = tabViewFromInteraction(v6);
  if (!v8 || (objc_opt_respondsToSelector() & 1) != 0 && [v8 presentationState] != 2)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];
    goto LABEL_37;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 hidesInactiveTabs])
  {
    v9 = [v7 items];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke;
    v59[3] = &unk_1E6D7E338;
    id v60 = v8;
    int v10 = objc_msgSend(v9, "safari_containsObjectPassingTest:", v59);

    id v11 = objc_alloc(MEMORY[0x1E4FB1740]);
    if (v10) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 2;
    }
    id v13 = (void *)[v11 initWithDropOperation:v12];

    goto LABEL_37;
  }
  uint64_t v14 = [v8 view];
  [v7 locationInView:v14];
  double v16 = v15;
  double v18 = v17;

  v19 = [(TabDragDropInteractionController *)self _autoscrollerForInteraction:v6];
  objc_msgSend(v19, "updateInteractionAtPoint:", v16, v18);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ([(TabDragDropInteractionController *)self _tabViewIsFilteringTabs:v8])
  {
    v21 = [v7 localDragSession];
    [(TabDragDropInteractionController *)self _unhideTabsForLocalDragSession:v21];

    v22 = [(NSMapTable *)self->_sessionToPlaceholderItemMap objectForKey:v7];
    if (v22) {
      [WeakRetained removePlaceholderItem:v22];
    }
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:1];
    goto LABEL_35;
  }
  unint64_t v23 = +[TabDocumentDropHandler proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:](TabDocumentDropHandler, "proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:", v7, [WeakRetained privateBrowsingEnabled]);
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v23];
  if (v23 != 1)
  {
    BOOL v24 = +[TabDocumentDropHandler canPinAllItemsInSession:v7];
    v25 = [(NSMapTable *)self->_sessionToPlaceholderItemMap objectForKey:v7];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke_2;
    v49[3] = &unk_1E6D7E360;
    id v26 = v8;
    id v50 = v26;
    double v56 = v16;
    double v57 = v18;
    BOOL v47 = v24;
    BOOL v58 = v24;
    id v48 = v25;
    id v51 = v48;
    id v46 = WeakRetained;
    id v52 = v46;
    id v27 = v7;
    id v53 = v27;
    v54 = self;
    id v28 = v6;
    id v55 = v28;
    v29 = (void (**)(void, void, void))MEMORY[0x1E4E42950](v49);
    if ([(TabDragDropInteractionController *)self _canOpenInCurrentTabForSession:v27 tabView:v26])
    {
      v45 = objc_msgSend(v26, "targetItemForDropAtPoint:", v16, v18);
      objc_msgSend(v26, "frameForItem:");
      CGFloat x = v62.origin.x;
      CGFloat y = v62.origin.y;
      CGFloat width = v62.size.width;
      CGFloat height = v62.size.height;
      CGRectGetMinX(v62);
      v63.origin.CGFloat x = x;
      v63.origin.CGFloat y = y;
      v63.size.CGFloat width = width;
      v63.size.CGFloat height = height;
      CGRectGetMaxX(v63);
      _SFClampPercent();
      double v35 = v34;
      if (v34 > 0.15 && v34 < 0.85)
      {
        v36 = [(NSMapTable *)self->_sessionToPlaceholderItemMap objectForKey:v27];
        if (v36)
        {
          [v46 removePlaceholderItem:v36];
          [(NSMapTable *)self->_sessionToPlaceholderItemMap removeObjectForKey:v27];
        }
        v22 = v48;
        v37 = v45;
        goto LABEL_34;
      }
      v36 = [(TabDragDropInteractionController *)self _insertPlaceholderIfNeededForSession:v27 interaction:v28];
      v37 = v45;
      ((void (**)(void, void *, void *))v29)[2](v29, v36, v45);
      if (([v45 isPinned] ^ 1 | v47))
      {
        v22 = v48;
        if (v35 < 0.15)
        {
          v39 = v46;
          v40 = v36;
          v41 = v45;
          goto LABEL_29;
        }
        goto LABEL_34;
      }
      v42 = v46;
      v43 = v36;
    }
    else
    {
      v37 = [(TabDragDropInteractionController *)self _insertPlaceholderIfNeededForSession:v27 interaction:v28];
      v36 = objc_msgSend(v26, "targetItemForDropAtPoint:", v16, v18);
      ((void (**)(void, void *, void *))v29)[2](v29, v37, v36);
      if (([v36 isPinned] ^ 1 | v47))
      {
        if (-[TabDragDropInteractionController _shouldMovePlaceholderItem:overTargetItem:withDropLocation:interaction:](self, "_shouldMovePlaceholderItem:overTargetItem:withDropLocation:interaction:", v37, v36, v28, v16, v18))
        {
          BOOL v38 = [(TabDragDropInteractionController *)self _placeholderMoveSatisfiesDelay];
          v22 = v48;
          if (v38)
          {
            v39 = v46;
            v40 = v37;
            v41 = v36;
LABEL_29:
            [v39 movePlaceholder:v40 overTabItem:v41];
          }
LABEL_34:

LABEL_35:
          goto LABEL_36;
        }
LABEL_33:
        v22 = v48;
        goto LABEL_34;
      }
      v42 = v46;
      v43 = v37;
    }
    [v42 movePlaceholderToEndOfPinnedTabs:v43];
    goto LABEL_33;
  }
LABEL_36:

LABEL_37:
  return v13;
}

BOOL __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "safari_localSourceTabView");
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    int v6 = objc_msgSend(*(id *)(a1 + 32), "shouldPinItemsDroppedAtPoint:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  }
  else {
    int v6 = 0;
  }
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v7 = [v5 isPinned] | v6;
    if ([v12 isPinned] != v7) {
      goto LABEL_9;
    }
LABEL_8:
    if (*(id *)(a1 + 40) == v12) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  uint64_t v7 = 0;
  if (([v12 isPinned] & 1) == 0) {
    goto LABEL_8;
  }
LABEL_9:
  [v12 setPinned:v7];
  [*(id *)(a1 + 48) movePlaceholderToEndOfPinnedTabs:v12];
  BOOL v8 = [*(id *)(a1 + 56) localDragSession];
  v9 = [v8 items];
  int v10 = [v9 firstObject];
  char v11 = objc_msgSend(v10, "safari_dragPreviewRequiresUpdateForTabView:pinned:", *(void *)(a1 + 32), v7);

  if ((v11 & 1) != 0 || v7 != [v12 isPinned]) {
    [*(id *)(a1 + 64) _updatePreviewsForInteraction:*(void *)(a1 + 72) session:*(void *)(a1 + 56) pinned:v7];
  }
LABEL_12:
}

- (BOOL)_canOpenInCurrentTabForSession:(id)a3 tabView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 items];
  uint64_t v9 = [v8 count];

  if (v9 == 1 && (objc_opt_respondsToSelector() & 1) != 0 && [v7 canDragOntoActiveTab])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (+[TabDocumentDropHandler proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:](TabDocumentDropHandler, "proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:", v6, [WeakRetained privateBrowsingEnabled]) == 2)
    {
      char v11 = [v7 view];
      [v6 locationInView:v11];
      double v13 = v12;
      double v15 = v14;

      double v16 = objc_msgSend(v7, "targetItemForDropAtPoint:", v13, v15);
      double v17 = [v16 UUID];
      double v18 = [WeakRetained tabWithUUID:v17];

      char v19 = [v18 isActive];
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)_shouldMovePlaceholderItem:(id)a3 overTargetItem:(id)a4 withDropLocation:(CGPoint)a5 interaction:(id)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v10 = a3;
  id v11 = a4;
  double v12 = tabViewFromInteraction(a6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v12 isStandalone])
      {
        uint64_t v13 = [v10 secondaryItem];

        id v10 = (id)v13;
      }
    }
  }
  BOOL v14 = 0;
  if (v11 && v10 != v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v12 presentationState] != 2) {
      goto LABEL_29;
    }
    double v52 = x;
    double v53 = y;
    [v12 frameForItem:v10];
    [v12 frameForItem:v11];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    UIRectGetCenter();
    double v24 = v23;
    double v26 = v25;
    UIRectGetCenter();
    double rect = v27;
    double v29 = v28 - v26;
    v55.origin.CGFloat x = v16;
    v55.origin.CGFloat y = v18;
    v55.size.CGFloat width = v20;
    v55.size.CGFloat height = v22;
    double Width = CGRectGetWidth(v55);
    v56.origin.CGFloat x = v16;
    v56.origin.CGFloat y = v18;
    v56.size.CGFloat width = v20;
    v56.size.CGFloat height = v22;
    double Height = CGRectGetHeight(v56);
    char v32 = (objc_opt_respondsToSelector() & 1) != 0 ? [v12 layoutAxes] : 3;
    if (v29 == 0.0 && (v32 & 2) != 0)
    {
      double v48 = v24;
      v57.origin.CGFloat x = v16;
      v57.origin.CGFloat y = v18;
      v57.size.CGFloat width = v20;
      v57.size.CGFloat height = v22;
      if (v53 < CGRectGetMinY(v57)) {
        goto LABEL_28;
      }
      v58.origin.CGFloat x = v16;
      v58.origin.CGFloat y = v18;
      v58.size.CGFloat width = v20;
      v58.size.CGFloat height = v22;
      if (v53 > CGRectGetMaxY(v58)) {
        goto LABEL_28;
      }
    }
    double v33 = Height / 3.0;
    if (v29 > 0.0)
    {
      v59.origin.CGFloat x = v16;
      v59.origin.CGFloat y = v18;
      v59.size.CGFloat width = v20;
      v59.size.CGFloat height = v22;
      if (v53 > CGRectGetMaxY(v59) - v33) {
        goto LABEL_28;
      }
    }
    if (v29 < 0.0)
    {
      v60.origin.CGFloat x = v16;
      v60.origin.CGFloat y = v18;
      v60.size.CGFloat width = v20;
      v60.size.CGFloat height = v22;
      if (v53 < v33 + CGRectGetMinY(v60)) {
        goto LABEL_28;
      }
    }
    double v34 = rect - v24;
    if (rect - v24 == 0.0 && (v32 & 1) != 0)
    {
      v61.origin.CGFloat x = v16;
      v61.origin.CGFloat y = v18;
      v61.size.CGFloat width = v20;
      v61.size.CGFloat height = v22;
      if (v52 < CGRectGetMinX(v61)) {
        goto LABEL_28;
      }
      v62.origin.CGFloat x = v16;
      v62.origin.CGFloat y = v18;
      v62.size.CGFloat width = v20;
      v62.size.CGFloat height = v22;
      if (v53 > CGRectGetMaxX(v62)) {
        goto LABEL_28;
      }
    }
    double v35 = Width / 3.0;
    v36 = objc_msgSend(v12, "view", *(void *)&v48);
    [v36 bounds];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v54 = v41;
    CGFloat recta = v42;

    if (v34 > 0.0)
    {
      v63.origin.CGFloat x = v16;
      v63.origin.CGFloat y = v18;
      v63.size.CGFloat width = v20;
      v63.size.CGFloat height = v22;
      double v49 = v35;
      double MaxX = CGRectGetMaxX(v63);
      v64.origin.CGFloat x = v38;
      v64.origin.CGFloat y = v40;
      v64.size.CGFloat width = v54;
      v64.size.CGFloat height = recta;
      double v44 = fmin(MaxX, CGRectGetMaxX(v64) + -100.0);
      double v35 = v49;
      if (v52 > v44 - v49) {
        goto LABEL_28;
      }
    }
    if (v34 >= 0.0) {
      goto LABEL_29;
    }
    v65.origin.CGFloat x = v16;
    v65.origin.CGFloat y = v18;
    v65.size.CGFloat width = v20;
    v65.size.CGFloat height = v22;
    double v45 = v35;
    double MinX = CGRectGetMinX(v65);
    v66.origin.CGFloat x = v38;
    v66.origin.CGFloat y = v40;
    v66.size.CGFloat width = v54;
    v66.size.CGFloat height = recta;
    if (v52 < v45 + fmax(MinX, CGRectGetMinX(v66) + 100.0)) {
LABEL_28:
    }
      BOOL v14 = 1;
    else {
LABEL_29:
    }
      BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_placeholderMoveSatisfiesDelay
{
  return 1;
}

- (BOOL)_tabViewIsFilteringTabs:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3;
    id v5 = [v4 searchController];
    if ([v5 isSearching])
    {
      id v6 = [v4 searchController];
      id v7 = [v6 searchTerm];
      BOOL v8 = [v7 length] != 0;
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

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (void)_cleanUpDropPlaceholderForSession:(id)a3 interaction:(id)a4
{
  id v6 = a3;
  id v7 = [(TabDragDropInteractionController *)self _autoscrollerForInteraction:a4];
  [v7 endInteraction];

  BOOL v8 = [(NSMapTable *)self->_sessionToPlaceholderItemMap objectForKey:v6];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__TabDragDropInteractionController__cleanUpDropPlaceholderForSession_interaction___block_invoke;
    v11[3] = &unk_1E6D78980;
    v11[4] = self;
    id v12 = v8;
    id v10 = v6;
    id v13 = v10;
    [WeakRetained performBatchUpdatesWithBlock:v11];

    [(NSMapTable *)self->_sessionToPlaceholderItemMap removeObjectForKey:v10];
  }
}

void __82__TabDragDropInteractionController__cleanUpDropPlaceholderForSession_interaction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained removePlaceholderItem:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 48) localDragSession];
  [v3 _unhideTabsForLocalDragSession:v4];
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6 = a4;
  id v7 = tabViewFromInteraction(a3);
  if (objc_opt_respondsToSelector()) {
    int v8 = [v7 hidesInactiveTabs];
  }
  else {
    int v8 = 0;
  }
  if ([(TabDragDropInteractionController *)self _canOpenInCurrentTabForSession:v6 tabView:v7])
  {
    uint64_t v9 = [(NSMapTable *)self->_sessionToPlaceholderItemMap objectForKey:v6];
    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  if ((v8 | v10) == 1)
  {
    id v11 = [MEMORY[0x1E4F78598] builder];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke;
    v16[3] = &unk_1E6D78D20;
    id v17 = v7;
    [v11 buildNavigationIntentForDropSession:v6 completionHandler:v16];

    id v12 = v17;
  }
  else
  {
    dropHandler = self->_dropHandler;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2;
    v14[3] = &unk_1E6D7B058;
    v14[4] = self;
    id v15 = v6;
    [(TabDocumentDropHandler *)dropHandler dropItemsForSession:v15 withInsertionHandler:v14];
    id v12 = v15;
  }
}

uint64_t __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) performDropWithNavigationIntent:a2];
  }
  return result;
}

void __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy__14;
  CGFloat v22 = __Block_byref_object_dispose__14;
  id v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_55;
  v13[3] = &unk_1E6D7E388;
  id v5 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v17 = &v18;
  id v6 = WeakRetained;
  id v15 = v6;
  id v7 = v3;
  id v16 = v7;
  [v6 performBatchUpdatesWithBlock:v13];
  int v8 = [(id)v19[5] firstObject];
  uint64_t v9 = [v8 webExtensionsController];

  BOOL v10 = [v9 tabIDToTabPositionForTabsInTransit];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F98FC0] tabIDToTabPositionDictionaryForTabs:v19[5]];
    [v9 fireAppropriateTabMovementEventForTabState:v12];
  }
  _Block_object_dispose(&v18, 8);
}

void __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_55(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v25 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 48), "replacePlaceholderItem:withTabsForDropSession:dragItems:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2_56;
  v43[3] = &unk_1E6D7A0A0;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v44 = v6;
  uint64_t v45 = v7;
  [v5 enumerateObjectsUsingBlock:v43];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v28 = a1;
  id obj = *(id *)(a1 + 56);
  uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v40;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v8;
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        BOOL v10 = [*(id *)(*(void *)(v28 + 32) + 16) objectForKey:v9];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v36;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v36 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
              id v16 = objc_msgSend(v9, "_sf_localBookmark");
              if ([v16 isFolder]) {
                uint64_t v17 = 3;
              }
              else {
                uint64_t v17 = 2;
              }

              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              uint64_t v18 = [v15 tabCollectionItems];
              uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v46 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v32;
                do
                {
                  uint64_t v22 = 0;
                  do
                  {
                    if (*(void *)v32 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    [*(id *)(*((void *)&v31 + 1) + 8 * v22++) setDragState:v17];
                  }
                  while (v20 != v22);
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v46 count:16];
                }
                while (v20);
              }

              ++v14;
            }
            while (v14 != v12);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v29);
  }

  [*(id *)(*(void *)(v28 + 32) + 8) removeObjectForKey:*(void *)(v28 + 40)];
  id v23 = *(void **)(v28 + 32);
  double v24 = [*(id *)(v28 + 40) localDragSession];
  [v23 _unhideTabsForLocalDragSession:v24];
}

void __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2_56(uint64_t a1, void *a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:v6];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v7 arrayByAddingObject:v5];
  }
  else
  {
    v10[0] = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  [*(id *)(*(void *)(a1 + 40) + 16) setObject:v9 forKey:v6];
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained didEndTrackingSession:v7];

  [(TabDragDropInteractionController *)self _cleanUpDropPlaceholderForSession:v7 interaction:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = objc_msgSend(v7, "items", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NSMapTable *)self->_insertedTabsForDragItems removeObjectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = tabViewFromInteraction(a3);
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v10 hidesInactiveTabs] & 1) != 0
    || ([(NSMapTable *)self->_insertedTabsForDragItems objectForKey:v8],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        v11,
        !v12))
  {
    long long v41 = 0;
  }
  else
  {
    uint64_t v13 = [(NSMapTable *)self->_insertedTabsForDragItems objectForKey:v8];
    long long v14 = [v13 firstObject];
    long long v15 = [v14 itemForTabCollectionView:v10];

    if ((unint64_t)[v13 count] < 2)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ([v10 targetedDragPreviewForDroppingItem:v15],
            (long long v41 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [v10 supportsDropTransitionToItemView])
        {
          long long v42 = [(TabDragDropInteractionController *)self _viewForTransitionToItem:v15 withTabCollectionView:v10];
          if (v42)
          {
            id v43 = objc_alloc_init(MEMORY[0x1E4FB1720]);
            id v44 = [MEMORY[0x1E4FB1618] clearColor];
            [v43 setBackgroundColor:v44];

            long long v41 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v42 parameters:v43];
          }
          else
          {
            long long v41 = 0;
          }
        }
        else
        {
          long long v41 = 0;
        }
      }
    }
    else
    {
      [v10 frameForItem:v15];
      CGFloat x = v16;
      CGFloat y = v18;
      CGFloat width = v20;
      CGFloat height = v22;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      double v24 = objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v49 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = [*(id *)(*((void *)&v48 + 1) + 8 * i) itemForTabCollectionView:v10];
            [v10 frameForItem:v29];
            v57.origin.CGFloat x = v30;
            v57.origin.CGFloat y = v31;
            v57.size.CGFloat width = v32;
            v57.size.CGFloat height = v33;
            v55.origin.CGFloat x = x;
            v55.origin.CGFloat y = y;
            v55.size.CGFloat width = width;
            v55.size.CGFloat height = height;
            CGRect v56 = CGRectUnion(v55, v57);
            CGFloat x = v56.origin.x;
            CGFloat y = v56.origin.y;
            CGFloat width = v56.size.width;
            CGFloat height = v56.size.height;
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v26);
      }

      UIRectGetCenter();
      double v35 = v34;
      double v37 = v36;
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeScale(&v47, 0.0, 0.0);
      id v38 = objc_alloc(MEMORY[0x1E4FB1728]);
      long long v39 = [v10 view];
      CGAffineTransform v46 = v47;
      long long v40 = objc_msgSend(v38, "initWithContainer:center:transform:", v39, &v46, v35, v37);
      long long v41 = [v9 retargetedPreviewWithTarget:v40];
    }
  }

  return v41;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v30 = a5;
  id v9 = tabViewFromInteraction(a3);
  uint64_t v28 = self;
  uint64_t v26 = v8;
  uint64_t v10 = [(NSMapTable *)self->_insertedTabsForDragItems objectForKey:v8];
  unint64_t v11 = [v10 count];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  uint64_t v13 = &unk_1E6D7A378;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v38;
    do
    {
      uint64_t v16 = 0;
      uint64_t v27 = v14;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v37 + 1) + 8 * v16);
        double v18 = [v17 itemForTabCollectionView:v9];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
        v36[3] = v13;
        v36[4] = v17;
        [v30 addCompletion:v36];
        if (v11 <= 1)
        {
          uint64_t v19 = [(TabDragDropInteractionController *)v28 _viewForTransitionToItem:v18 withTabCollectionView:v9];
          double v20 = v19;
          if (v19)
          {
            uint64_t v21 = v15;
            double v22 = v13;
            unint64_t v23 = v11;
            double v24 = (void *)MEMORY[0x1E4FB1EB0];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2;
            v34[3] = &unk_1E6D77E20;
            id v25 = v19;
            id v35 = v25;
            [v24 performWithoutAnimation:v34];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3;
            v32[3] = &unk_1E6D77E20;
            id v33 = v25;
            [v30 addAnimations:v32];
            if (objc_opt_respondsToSelector()) {
              [v9 willAnimateDropForItem:v18 withAnimator:v30];
            }

            unint64_t v11 = v23;
            uint64_t v13 = v22;
            uint64_t v15 = v21;
            uint64_t v14 = v27;
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v14);
  }

  ++v28->_dropAnimationCount;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_4;
  v31[3] = v13;
  v31[4] = v28;
  [v30 addCompletion:v31];
}

void __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "tabCollectionItems", 0);
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
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setDragState:0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_4(uint64_t result)
{
  return result;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  tabViewFromInteraction(v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    long long v8 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v8, "didStartDragWithDragContentType:", objc_msgSend(v17, "itemDragContentType"));
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained willBeginDragSession:v6];

  uint64_t v10 = [v6 items];
  uint64_t v11 = +[TabDocumentDropHandler tabsForDragItems:v10];

  uint64_t v12 = [MEMORY[0x1E4F98FC0] tabIDToTabPositionDictionaryForTabs:v11];
  uint64_t v13 = (void *)[v12 mutableCopy];
  uint64_t v14 = [v11 firstObject];
  uint64_t v15 = [v14 webExtensionsController];
  [v15 setTabIDToTabPositionForTabsInTransit:v13];

  pendingDragSession = self->_pendingDragSession;
  self->_pendingDragSession = 0;

  [(TabDragDropInteractionController *)self _transitionToDragState:1 fromDragState:-1 forTabCollectionItemsInSession:v6 interaction:v7];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_pendingDragSession || self->_dropAnimationCount)
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v10 = tabViewFromInteraction(v6);
    if (([(NSMutableSet *)self->_tabViewsPendingActivation containsObject:v10] & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && ([v10 lastDecelerationWasInterrupted] & 1) != 0)
    {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      objc_storeStrong((id *)&self->_pendingDragSession, a4);
      uint64_t v11 = [v10 view];
      [v7 locationInView:v11];
      id v8 = -[TabDragDropInteractionController _newDragItemsAtPoint:excludingTabUUIDs:interaction:session:](self, "_newDragItemsAtPoint:excludingTabUUIDs:interaction:session:", 0, v6, v7);
    }
  }

  return v8;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 view];
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v12 = [v9 items];
  uint64_t v13 = objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = [v9 items];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v20 = objc_msgSend(v19, "safari_localWBTab");

        if (v20)
        {
          uint64_t v21 = objc_msgSend(v19, "safari_localWBTab");
          double v22 = [v21 uuid];
          [v13 addObject:v22];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }

  objc_msgSend(v10, "convertPoint:toView:", v10, x, y);
  id v23 = -[TabDragDropInteractionController _newDragItemsAtPoint:excludingTabUUIDs:interaction:session:](self, "_newDragItemsAtPoint:excludingTabUUIDs:interaction:session:", v13, v8, v9);

  return v23;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "safari_localWBTab");
  id v9 = objc_msgSend(v7, "safari_localTabItem");

  uint64_t v10 = 0;
  if (v8 && v9)
  {
    uint64_t v11 = tabViewFromInteraction(v6);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v11 targetedDragPreviewForLiftingItem:v9],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [v11 viewForItem:v9];
        uint64_t v10 = [v12 window];

        if (v10) {
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v12];
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
  }
  return v10;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained willEndDragSession:v8];

  uint64_t v11 = [v8 items];
  id v14 = +[TabDocumentDropHandler tabsForDragItems:v11];

  uint64_t v12 = [v14 firstObject];
  uint64_t v13 = [v12 webExtensionsController];
  [v13 setTabIDToTabPositionForTabsInTransit:0];

  [(TabDragDropInteractionController *)self _transitionToDragState:0 fromDragState:1 forTabCollectionItemsInSession:v8 interaction:v9];
  [(NSMapTable *)self->_hasHiddenDocumentsForDragSessions removeObjectForKey:v8];
  [(TabDragDropInteractionController *)self _cleanUpDragPreviewForSesssion:v8];
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v19 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 items];
  uint64_t v12 = +[TabDocumentDropHandler tabsForDragItems:v11];

  uint64_t v13 = [MEMORY[0x1E4F98FC0] tabIDToTabPositionDictionaryForTabs:v12];
  id v14 = [v12 firstObject];
  uint64_t v15 = [v14 webExtensionsController];
  uint64_t v16 = [v15 tabIDToTabPositionForTabsInTransit];
  [v16 addEntriesFromDictionary:v13];

  [(TabDragDropInteractionController *)self _transitionToDragState:1 fromDragState:-1 forTabCollectionItemsInSession:v9 interaction:v10];
  uint64_t v17 = [(NSMapTable *)self->_hasHiddenDocumentsForDragSessions objectForKey:v9];

  LODWORD(v9) = [v17 BOOLValue];
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained hideTabsForDragItems:v19];
  }
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  [(TabDragDropInteractionController *)self _cleanUpDragPreviewForSesssion:self->_pendingDragSession];
  pendingDragSession = self->_pendingDragSession;
  self->_pendingDragSession = 0;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)_cleanUpDragPreviewForSesssion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(a3, "items", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "safari_localSourceTabView");
        if (objc_opt_respondsToSelector())
        {
          id v10 = objc_msgSend(v8, "safari_localTabItem");
          [v9 cleanUpDragPreviewForItem:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return 3;
}

- (id)_newDragItemsAtPoint:(CGPoint)a3 excludingTabUUIDs:(id)a4 interaction:(id)a5 session:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = -[TabDragDropInteractionController _tabCollectionItemAtPoint:interaction:](self, "_tabCollectionItemAtPoint:interaction:", v12, x, y);
  uint64_t v15 = v14;
  if (v14 && ![v14 dragState])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    double v18 = [v15 UUID];
    id v19 = [WeakRetained tabWithUUID:v18];
    double v20 = [v19 wbTab];

    if (!v20) {
      goto LABEL_13;
    }
    uint64_t v21 = [v20 uuid];
    char v22 = [v11 containsObject:v21];

    if (v22) {
      goto LABEL_13;
    }
    id v23 = [v13 items];
    BOOL v24 = +[TabDocumentDropHandler canAddTab:v20 toSessionWithDragItems:v23];

    if (v24)
    {
      id v25 = tabViewFromInteraction(v12);
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v25 presentationState] != 2
        || [v20 isBlank]
        && (objc_opt_respondsToSelector() & 1) != 0
        && ([v25 hidesInactiveTabs] & 1) != 0)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        long long v27 = [WeakRetained dragItemForTab:v20 tabItem:v15];
        v28[0] = v27;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      }
    }
    else
    {
LABEL_13:
      uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)_tabCollectionItemAtPoint:(CGPoint)a3 interaction:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = tabViewFromInteraction(a4);
  id v7 = objc_msgSend(v6, "itemAtPoint:", x, y);

  return v7;
}

- (void)_unhideTabsForLocalDragSession:(id)a3
{
  if (a3)
  {
    p_dataSource = &self->_dataSource;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    uint64_t v6 = [v7 items];
    [WeakRetained unhideTabsForDragItems:v6];

    [(NSMapTable *)self->_hasHiddenDocumentsForDragSessions setObject:MEMORY[0x1E4F1CC28] forKey:v7];
  }
}

- (id)_viewForTransitionToItem:(id)a3 withTabCollectionView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 supportsDropTransitionToItemView])
  {
    id v7 = [v6 viewForItem:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_insertPlaceholderIfNeededForSession:(id)a3 interaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__14;
  char v22 = __Block_byref_object_dispose__14;
  id v23 = [(NSMapTable *)self->_sessionToPlaceholderItemMap objectForKey:v6];
  if (v19[5] && objc_msgSend(WeakRetained, "isPlaceholderItemValid:"))
  {
    id v9 = (id)v19[5];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__TabDragDropInteractionController__insertPlaceholderIfNeededForSession_interaction___block_invoke;
    v12[3] = &unk_1E6D7E3B0;
    uint64_t v17 = &v18;
    id v13 = WeakRetained;
    id v14 = v7;
    id v10 = v6;
    id v15 = v10;
    uint64_t v16 = self;
    [v13 performBatchUpdatesWithBlock:v12];
    [(NSMapTable *)self->_sessionToPlaceholderItemMap setObject:v19[5] forKey:v10];
    id v9 = (id)v19[5];
  }
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __85__TabDragDropInteractionController__insertPlaceholderIfNeededForSession_interaction___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "removePlaceholderItem:");
  }
  tabViewFromInteraction(*(void **)(a1 + 40));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = [v12 view];
  [v2 locationInView:v3];
  uint64_t v4 = objc_msgSend(v12, "targetItemForDropAtPoint:");

  id v5 = [*(id *)(a1 + 48) localDragSession];
  id v6 = v5;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 items];
    [v7 hideTabsForDragItems:v8];

    [*(id *)(*(void *)(a1 + 56) + 32) setObject:MEMORY[0x1E4F1CC38] forKey:v6];
  }
  uint64_t v9 = [*(id *)(a1 + 32) insertPlaceholderAfterTabItem:v4];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (void)_transitionToDragState:(int64_t)a3 fromDragState:(int64_t)a4 forTabCollectionItemsInSession:(id)a5 interaction:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v24 = a6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [a5 items];
  uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "safari_localTabItem");
        if (v14)
        {
          id v15 = objc_msgSend(v13, "safari_localTabItem");
          double v36 = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        }
        else
        {
          uint64_t v16 = [(NSMapTable *)self->_insertedTabsForDragItems objectForKey:v13];
        }

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v28 != v20) {
                objc_enumerationMutation(v17);
              }
              char v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              if (a4 == -1 || [*(id *)(*((void *)&v27 + 1) + 8 * j) dragState] == a4) {
                [v22 setDragState:a3];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v19);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }

  id v23 = [v24 view];
  [v23 setNeedsLayout];
}

- (id)_autoscrollerForInteraction:(id)a3
{
  uint64_t v3 = tabViewFromInteraction(a3);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 reorderingAutoscroller];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_updatePreviewsForInteraction:(id)a3 session:(id)a4 pinned:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = tabViewFromInteraction(a3);
  if (objc_opt_respondsToSelector())
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v7;
    uint64_t v9 = [v7 localDragSession];
    uint64_t v10 = [v9 items];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "safari_localTabItem");
          id v17 = objc_msgSend(v15, "safari_localSourceTabView");
          if (v16)
          {
            uint64_t v18 = objc_opt_class();
            if (v18 == objc_opt_class())
            {
              uint64_t v19 = [v8 dragPreviewForItem:v16 pinned:v5];
              uint64_t v20 = v19;
              if (v19)
              {
                v22[0] = MEMORY[0x1E4F143A8];
                v22[1] = 3221225472;
                v22[2] = __81__TabDragDropInteractionController__updatePreviewsForInteraction_session_pinned___block_invoke;
                v22[3] = &unk_1E6D78CF8;
                id v23 = v19;
                [v15 setPreviewProvider:v22];
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id v7 = v21;
  }
}

id __81__TabDragDropInteractionController__updatePreviewsForInteraction_session_pinned___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = tabViewFromInteraction(v7);
  if ([(NSMutableSet *)self->_tabViewsPendingActivation containsObject:v8])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = -[TabDragDropInteractionController _tabCollectionItemAtPoint:interaction:](self, "_tabCollectionItemAtPoint:interaction:", v7, x, y);
    uint64_t v11 = v10;
    if (!v10
      || [v10 dragState]
      || (objc_opt_respondsToSelector() & 1) != 0 && ([v8 lastDecelerationWasInterrupted] & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && [v8 presentationState] != 2)
    {
      uint64_t v9 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      id v14 = [v11 UUID];
      id v15 = [WeakRetained tabWithUUID:v14];

      if (v15)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v16 = [v8 contextMenuOptionsForItem:v11];
        }
        else {
          uint64_t v16 = 4470;
        }
        id v17 = [WeakRetained tabMenuProviderDataSource];
        uint64_t v18 = +[TabMenuProvider actionProviderForTab:v15 dataSource:v17 options:v16];

        if (v18)
        {
          if (objc_opt_respondsToSelector()) {
            [v8 willBeginShowingContextMenuForItem:v11];
          }
          uint64_t v19 = [TabContextMenuIdentifier alloc];
          uint64_t v20 = [v11 UUID];
          id v21 = [(TabContextMenuIdentifier *)v19 initWithTabUUID:v20 sourceItem:v11];

          uint64_t v9 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:v21 previewProvider:0 actionProvider:v18];
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = a5;
  id v7 = tabViewFromInteraction(a3);
  id v8 = [v6 sourceItem];

  if (objc_opt_respondsToSelector())
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v7 targetedDragPreviewForLiftingItem:v8],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v10 = [v7 viewForItem:v8];
      uint64_t v9 = [v10 window];

      if (v9) {
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v10];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = tabViewFromInteraction(v8);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v10 sourceItem],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v11 targetedPreviewForDismissingMenuForItem:v12],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    uint64_t v13 = [(TabDragDropInteractionController *)self contextMenuInteraction:v8 configuration:v9 highlightPreviewForItemWithIdentifier:v10];
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = tabViewFromInteraction(a3);
  uint64_t v11 = [v9 identifier];

  uint64_t v12 = [v11 sourceItem];

  if (v12)
  {
    [(NSMutableSet *)self->_tabViewsPendingActivation addObject:v10];
    [v8 setPreferredCommitStyle:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __117__TabDragDropInteractionController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v13[3] = &unk_1E6D78980;
    v13[4] = self;
    id v14 = v10;
    id v15 = v12;
    [v8 addCompletion:v13];
  }
}

uint64_t __117__TabDragDropInteractionController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 48) removeObject:a1[5]];
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  return [v2 activateItem:v3];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = tabViewFromInteraction(a3);
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v7 identifier];
    uint64_t v11 = [v10 sourceItem];

    if (v11)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __92__TabDragDropInteractionController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
      v12[3] = &unk_1E6D77D90;
      id v13 = v9;
      id v14 = v11;
      [v8 addCompletion:v12];
    }
  }
}

uint64_t __92__TabDragDropInteractionController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndShowingContextMenuForItem:*(void *)(a1 + 40)];
}

- (TabDragDropDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (TabDragDropDataSource *)WeakRetained;
}

- (TabDocumentDropHandler)dropHandler
{
  return self->_dropHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropHandler, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_tabViewsPendingActivation, 0);
  objc_storeStrong((id *)&self->_pendingDragSession, 0);
  objc_storeStrong((id *)&self->_hasHiddenDocumentsForDragSessions, 0);
  objc_storeStrong((id *)&self->_insertedTabsForDragItems, 0);
  objc_storeStrong((id *)&self->_sessionToPlaceholderItemMap, 0);
}

@end