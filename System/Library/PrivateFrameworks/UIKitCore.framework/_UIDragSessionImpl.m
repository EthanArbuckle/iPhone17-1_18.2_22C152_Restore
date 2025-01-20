@interface _UIDragSessionImpl
+ (id)_localDragSessionForSessionDestination:(id)a3;
+ (id)activeSessions;
- (BOOL)_allowsItemsToUpdate;
- (BOOL)_canAddItems;
- (BOOL)_isActive;
- (BOOL)_sentSessionDidBegin;
- (BOOL)_setDownAnimation:(id)a3 shouldDelaySetDownOfDragItem:(id)a4 completion:(id)a5;
- (BOOL)allowsMoveOperation;
- (BOOL)canLoadObjectsOfClass:(Class)a3;
- (BOOL)draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3;
- (BOOL)draggingSessionPrefersFullSizePreviews:(id)a3;
- (BOOL)hasItemsConformingToTypeIdentifiers:(id)a3;
- (BOOL)isRestrictedToDraggingApplication;
- (CGPoint)locationInView:(id)a3;
- (NSArray)items;
- (NSSet)trackedInteractions;
- (UIDragInteraction)primaryInteraction;
- (_UIDragSessionImpl)initWithInteraction:(id)a3;
- (_UIInternalDraggingSessionSource)_internalDragSession;
- (id)_internalSession;
- (id)_setDownAnimation:(id)a3 customSpringAnimationBehaviorForSetDownOfDragItem:(id)a4;
- (id)_setDownAnimation:(id)a3 prepareForSetDownOfDragItem:(id)a4 visibleDroppedItem:(id)a5;
- (id)_windowForSetDownOfDragItem:(id)a3;
- (id)dragSourceInteractionForDragItem:(id)a3;
- (id)localContext;
- (int64_t)_dataOwner;
- (unint64_t)draggingSession:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4;
- (unsigned)_sessionIdentifier;
- (void)_cancelDrag;
- (void)_draggingSession:(id)a3 handedOffDragImageForItem:(id)a4;
- (void)_draggingSessionHandedOffDragImage:(id)a3;
- (void)_itemsNeedUpdate:(id)a3;
- (void)_setDownAnimation:(id)a3 willAnimateSetDownOfDragItem:(id)a4 withAnimator:(id)a5 preview:(id)a6;
- (void)_setInternalDragSession:(id)a3;
- (void)_setSentSessionDidBegin:(BOOL)a3;
- (void)addItems:(id)a3 forDragSourceInteraction:(id)a4;
- (void)draggingSession:(id)a3 willAddItems:(id)a4;
- (void)draggingSessionDidEnd:(id)a3 withOperation:(unint64_t)a4;
- (void)draggingSessionDidMove:(id)a3;
- (void)draggingSessionDidTransferItems:(id)a3;
- (void)draggingSessionWillBegin:(id)a3;
- (void)draggingSessionWillEnd:(id)a3 withOperation:(unint64_t)a4;
- (void)setLocalContext:(id)a3;
@end

@implementation _UIDragSessionImpl

+ (id)activeSessions
{
  v2 = (void *)[(id)__activeDragSessionsTable copy];
  return v2;
}

- (_UIDragSessionImpl)initWithInteraction:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIDragSession.m", 81, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIDragSessionImpl;
  v6 = [(_UIDragSessionImpl *)&v15 init];
  if (v6)
  {
    if (initWithInteraction__onceToken != -1) {
      dispatch_once(&initWithInteraction__onceToken, &__block_literal_global_169);
    }
    uint64_t v7 = objc_opt_new();
    allItems = v6->_allItems;
    v6->_allItems = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    dragSourceInteractionByItem = v6->_dragSourceInteractionByItem;
    v6->_dragSourceInteractionByItem = (NSMapTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    allInteractions = v6->_allInteractions;
    v6->_allInteractions = (NSHashTable *)v11;

    [(NSHashTable *)v6->_allInteractions addObject:v5];
    objc_storeWeak((id *)&v6->_primaryInteraction, v5);
    _UIInitializeDraggingSystem();
  }

  return v6;
}

- (BOOL)_canAddItems
{
  return [(_UIInternalDraggingSessionSource *)self->_internalDragSession canAddItems];
}

- (BOOL)_isActive
{
  return [(_UIInternalDraggingSessionSource *)self->_internalDragSession isActive];
}

- (NSSet)trackedInteractions
{
  return [(NSHashTable *)self->_allInteractions setRepresentation];
}

- (void)addItems:(id)a3 forDragSourceInteraction:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(NSHashTable *)self->_allInteractions addObject:v7];
  v8 = [v6 reverseObjectEnumerator];
  uint64_t v9 = [v8 allObjects];

  -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_allItems, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, v9);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NSMapTable *)self->_dragSourceInteractionByItem setObject:v7 forKey:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  objc_super v15 = [(_UIDragSessionImpl *)self _internalDragSession];
  if (v15)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v22 + 1) + 8 * j);
          objc_msgSend(v21, "_setDragDropSession:", self, (void)v22);
          [v21 _setSourceVisualTarget:self];
          [v21 _loadOriginalImageComponentProvider];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v18);
    }

    if ([v16 count]) {
      [v15 addPublicItems:v16];
    }
  }
}

- (id)dragSourceInteractionForDragItem:(id)a3
{
  return [(NSMapTable *)self->_dragSourceInteractionByItem objectForKey:a3];
}

- (id)_internalSession
{
  return self->_internalDragSession;
}

- (void)_setInternalDragSession:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_internalDragSession, a3);
  if (self->_internalDragSession)
  {
    [(id)__activeDragSessionsTable addObject:self];
    [(_UIInternalDraggingSessionSource *)self->_internalDragSession setDelegate:self];
  }
}

+ (id)_localDragSessionForSessionDestination:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [a3 inAppSessionSource];
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = +[_UIDragSessionImpl activeSessions];
    id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v9 = [v8 _internalDragSession];

          if (v9 == v3)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_itemsNeedUpdate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_addedDraggingItemsWaitingForHandOffOfDragImage count])
  {
    id v5 = (NSMutableSet *)objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          int v12 = -[NSMutableSet containsObject:](self->_addedDraggingItemsWaitingForHandOffOfDragImage, "containsObject:", v11, (void)v16);
          addedDragItemsPendingUpdate = v5;
          if (v12)
          {
            addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
            if (!addedDragItemsPendingUpdate)
            {
              long long v14 = (NSMutableSet *)objc_opt_new();
              objc_super v15 = self->_addedDragItemsPendingUpdate;
              self->_addedDragItemsPendingUpdate = v14;

              addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
            }
          }
          [(NSMutableSet *)addedDragItemsPendingUpdate addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    _markItemsForUpdate(v5, self);
  }
  else
  {
    _markItemsForUpdate(v4, self);
  }
}

- (BOOL)_allowsItemsToUpdate
{
  if (!self->_didHandOffDragImage) {
    return 0;
  }
  v2 = [(_UIDragSessionImpl *)self _internalDragSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)_dataOwner
{
  return [(_UIInternalDraggingSessionSource *)self->_internalDragSession dataOwner];
}

- (void)_cancelDrag
{
}

- (NSArray)items
{
  return (NSArray *)self->_allItems;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"View must be non-null"];
  }
  internalDragSession = self->_internalDragSession;
  if (internalDragSession)
  {
    [(_UIInternalDraggingSessionSource *)internalDragSession draggingLocationInCoordinateSpace:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
    [WeakRetained _locationInView:v4];
    double v7 = v11;
    double v9 = v12;
  }
  double v13 = v7;
  double v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)allowsMoveOperation
{
  internalDragSession = self->_internalDragSession;
  if (internalDragSession)
  {
    unint64_t v4 = [(_UIInternalDraggingSessionSource *)internalDragSession withinAppSourceOperationMask];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
    unint64_t v4 = [WeakRetained _session:self sourceOperationMaskForDraggingWithinApp:1];
  }
  return (v4 >> 4) & 1;
}

- (BOOL)isRestrictedToDraggingApplication
{
  internalDragSession = self->_internalDragSession;
  if (internalDragSession)
  {
    char v4 = [(_UIInternalDraggingSessionSource *)internalDragSession outsideAppSourceOperationMask];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
    char v4 = [WeakRetained _session:self sourceOperationMaskForDraggingWithinApp:0];
  }
  return (v4 & 1) == 0;
}

- (BOOL)hasItemsConformingToTypeIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDragSessionImpl *)self items];
  char hasItemsConformingToTypeIdentifiers = _hasItemsConformingToTypeIdentifiers(v5, v4);

  return hasItemsConformingToTypeIdentifiers;
}

- (BOOL)canLoadObjectsOfClass:(Class)a3
{
  id v4 = [(_UIDragSessionImpl *)self items];
  LOBYTE(a3) = _canLoadObjectsOfClass(v4, (uint64_t)a3);

  return (char)a3;
}

- (unint64_t)draggingSession:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  unint64_t v7 = [WeakRetained _session:self sourceOperationMaskForDraggingWithinApp:v4];

  return v7;
}

- (BOOL)draggingSessionPrefersFullSizePreviews:(id)a3
{
  BOOL v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  LOBYTE(v3) = [WeakRetained _sessionPrefersFullSizePreviews:v3];

  return (char)v3;
}

- (BOOL)draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  BOOL v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  LOBYTE(v3) = [WeakRetained _sessionDynamicallyUpdatesPrefersFullSizePreviews:v3];

  return (char)v3;
}

- (void)draggingSessionWillBegin:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  [WeakRetained _sessionWillBegin:self];
}

- (void)_draggingSessionHandedOffDragImage:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  [WeakRetained _sessionHandedOffDragImage:self];
  self->_didHandOffDragImage = 1;
  if ((_MergedGlobals_1025 & 1) == 0)
  {
    _MergedGlobals_1025 = 1;
    [(id)UIApp _performBlockAfterCATransactionCommits:&__block_literal_global_265];
  }
}

- (void)_draggingSession:(id)a3 handedOffDragImageForItem:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(NSMutableSet *)self->_addedDraggingItemsWaitingForHandOffOfDragImage removeObject:v5];
  if (v5 && [(NSMutableSet *)self->_addedDragItemsPendingUpdate containsObject:v5])
  {
    [(NSMutableSet *)self->_addedDragItemsPendingUpdate removeObject:v5];
    v7[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(_UIDragSessionImpl *)self _itemsNeedUpdate:v6];
  }
}

- (void)draggingSessionDidMove:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = self->_allInteractions;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "_sessionDidMove:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)draggingSession:(id)a3 willAddItems:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [(_UIDragSessionImpl *)self dragSourceInteractionForDragItem:v6];

  addedDraggingItemsWaitingForHandOffOfDragImage = self->_addedDraggingItemsWaitingForHandOffOfDragImage;
  if (!addedDraggingItemsWaitingForHandOffOfDragImage)
  {
    long long v9 = (NSMutableSet *)objc_opt_new();
    long long v10 = self->_addedDraggingItemsWaitingForHandOffOfDragImage;
    self->_addedDraggingItemsWaitingForHandOffOfDragImage = v9;

    addedDraggingItemsWaitingForHandOffOfDragImage = self->_addedDraggingItemsWaitingForHandOffOfDragImage;
  }
  [(NSMutableSet *)addedDraggingItemsWaitingForHandOffOfDragImage addObjectsFromArray:v5];
  id v11 = v5;
  long long v12 = [(id)qword_1EB260378 objectForKey:self];
  if (v12)
  {
    double v13 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          if ([v12 containsObject:v19])
          {
            [v12 removeObject:v19];
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v16);
    }
  }
  else
  {
    double v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
  if (!addedDragItemsPendingUpdate)
  {
    uint64_t v21 = (NSMutableSet *)objc_opt_new();
    long long v22 = self->_addedDragItemsPendingUpdate;
    self->_addedDragItemsPendingUpdate = v21;

    addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
  }
  [(NSMutableSet *)addedDragItemsPendingUpdate addObjectsFromArray:v13];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v23 = self->_allInteractions;
  uint64_t v24 = [(NSHashTable *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        long long v29 = objc_msgSend(v11, "copy", (void)v30);
        [v28 _session:self willAddItems:v29 forInteraction:v7];
      }
      uint64_t v25 = [(NSHashTable *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v25);
  }
}

- (void)draggingSessionWillEnd:(id)a3 withOperation:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_allInteractions;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_sessionWillEnd:withOperation:", self, a4, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)draggingSessionDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4) {
    [(id)__activeDragSessionsTable removeObject:self];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_allInteractions;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "_sessionDidEnd:withOperation:", self, a4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)draggingSessionDidTransferItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = self->_allInteractions;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "_sessionDidTransferItems:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(id)__activeDragSessionsTable removeObject:self];
}

- (id)_windowForSetDownOfDragItem:(id)a3
{
  BOOL v3 = [(_UIDragSessionImpl *)self dragSourceInteractionForDragItem:a3];
  BOOL v4 = [v3 view];
  uint64_t v5 = [v4 _window];

  return v5;
}

- (id)_setDownAnimation:(id)a3 prepareForSetDownOfDragItem:(id)a4 visibleDroppedItem:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(_UIDragSessionImpl *)self dragSourceInteractionForDragItem:v9];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v9)
    {
      uint64_t v16 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v21) = 0;
        _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Cannot find item for dragging item", (uint8_t *)&v21, 2u);
      }
    }
  }
  else if (!v9)
  {
    long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260368) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Cannot find item for dragging item", (uint8_t *)&v21, 2u);
    }
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (!v10)
    {
      uint64_t v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v21 = 138412290;
        id v22 = v9;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "droppedItem for dragging item (%@) in nil", (uint8_t *)&v21, 0xCu);
      }

      goto LABEL_19;
    }
  }
  else if (!v10)
  {
    uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260370) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "droppedItem for dragging item (%@) in nil", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_19;
  }
  if (v9)
  {
    long long v12 = [v10 createSnapshotView];
    [v10 center];
    objc_msgSend(v12, "setCenter:");
    long long v13 = [v10 preview];
    uint64_t v14 = [v8 containerView];
    long long v15 = [v11 _session:self targetedPreviewForCancellingItem:v9 duiPreview:v13 snapshotView:v12 container:v14];

    goto LABEL_20;
  }
LABEL_19:
  long long v15 = 0;
LABEL_20:

  return v15;
}

- (void)_setDownAnimation:(id)a3 willAnimateSetDownOfDragItem:(id)a4 withAnimator:(id)a5 preview:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v9)
    {
      long long v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Item cannot be nil", buf, 2u);
      }
    }
  }
  else if (!v9)
  {
    long long v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview____s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Item cannot be nil", v13, 2u);
    }
  }
  id v10 = [(_UIDragSessionImpl *)self dragSourceInteractionForDragItem:v9];
  [v10 _session:self item:v9 willCancelWithAnimator:v8];
}

- (BOOL)_setDownAnimation:(id)a3 shouldDelaySetDownOfDragItem:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v8)
    {
      long long v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Item cannot be nil", buf, 2u);
      }
    }
  }
  else if (!v8)
  {
    long long v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setDownAnimation_shouldDelaySetDownOfDragItem_completion____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Item cannot be nil", v14, 2u);
    }
  }
  id v9 = [(_UIDragSessionImpl *)self dragSourceInteractionForDragItem:v8];
  char v10 = [v9 _session:self item:v8 shouldDelaySetDownAnimationWithCompletion:v7];

  return v10;
}

- (id)_setDownAnimation:(id)a3 customSpringAnimationBehaviorForSetDownOfDragItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_UIDragSessionImpl *)self dragSourceInteractionForDragItem:v5];
  id v7 = [v6 _session:self customSpringAnimationBehaviorForCancellingItem:v5];

  return v7;
}

- (unsigned)_sessionIdentifier
{
  return [(_UIInternalDraggingSessionSource *)self->_internalDragSession sessionIdentifier];
}

- (id)localContext
{
  return self->_localContext;
}

- (void)setLocalContext:(id)a3
{
}

- (_UIInternalDraggingSessionSource)_internalDragSession
{
  return self->_internalDragSession;
}

- (UIDragInteraction)primaryInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  return (UIDragInteraction *)WeakRetained;
}

- (BOOL)_sentSessionDidBegin
{
  return self->_sentSessionDidBegin;
}

- (void)_setSentSessionDidBegin:(BOOL)a3
{
  self->_sentSessionDidBegin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryInteraction);
  objc_storeStrong((id *)&self->_internalDragSession, 0);
  objc_storeStrong(&self->_localContext, 0);
  objc_storeStrong((id *)&self->_addedDragItemsPendingUpdate, 0);
  objc_storeStrong((id *)&self->_addedDraggingItemsWaitingForHandOffOfDragImage, 0);
  objc_storeStrong((id *)&self->_allInteractions, 0);
  objc_storeStrong((id *)&self->_dragSourceInteractionByItem, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end