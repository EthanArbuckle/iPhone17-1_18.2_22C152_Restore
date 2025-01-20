@interface _UIDropSessionImpl
- (BOOL)_allowsItemsToUpdate;
- (BOOL)_drivenByPointer;
- (BOOL)allowsMoveOperation;
- (BOOL)canLoadObjectsOfClass:(Class)a3;
- (BOOL)hasItemsConformingToTypeIdentifiers:(id)a3;
- (BOOL)isRestrictedToDraggingApplication;
- (CGPoint)_previewCenterForVisibleItem:(id)a3 inView:(id)a4;
- (CGPoint)locationInView:(id)a3;
- (CGSize)_previewSizeForVisibleItem:(id)a3;
- (NSArray)items;
- (NSProgress)progress;
- (UIDragSession)localDragSession;
- (_UIDropSessionImpl)initWithSessionDestination:(id)a3;
- (_UIInternalDraggingSessionDestination)sessionDestination;
- (id)_createItemsOfClass:(Class)a3 synchronouslyIfPossible:(BOOL)a4 completion:(id)a5;
- (id)_internalSession;
- (id)loadObjectsOfClass:(Class)a3 completion:(id)a4;
- (int64_t)_dataOwner;
- (unint64_t)_operationMask;
- (unint64_t)progressIndicatorStyle;
- (unsigned)_sessionIdentifier;
- (void)_itemsNeedUpdate:(id)a3;
- (void)requestVisibleItems:(id)a3;
- (void)setProgressIndicatorStyle:(unint64_t)a3;
@end

@implementation _UIDropSessionImpl

- (_UIDropSessionImpl)initWithSessionDestination:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UIDragSession.m", 472, @"Invalid parameter not satisfying: %@", @"sessionDestination" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIDropSessionImpl;
  v7 = [(_UIDropSessionImpl *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_sessionDestination, a3);
    v8->_progressIndicatorStyle = 1;
    [(_UIInternalDraggingSessionDestination *)v8->_sessionDestination setProgressIndicatorStyle:1];
    uint64_t v9 = +[_UIDragSessionImpl _localDragSessionForSessionDestination:v6];
    localDragSession = v8->_localDragSession;
    v8->_localDragSession = (UIDragSession *)v9;
  }
  return v8;
}

- (NSProgress)progress
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination progress];
}

- (NSArray)items
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  items = self->_items;
  if (!items
    || (uint64_t v4 = [(NSArray *)items count],
        [(_UIInternalDraggingSessionDestination *)self->_sessionDestination internalItems],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4 != v6))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v8 = [(_UIInternalDraggingSessionDestination *)self->_sessionDestination internalItems];
    uint64_t v9 = (NSArray *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = [(_UIInternalDraggingSessionDestination *)self->_sessionDestination internalItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v15 _setDragDropSession:self];
          [(NSArray *)v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    v16 = self->_items;
    self->_items = v9;
  }
  v17 = self->_items;
  return v17;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"View must be non-null"];
  }
  [(_UIInternalDraggingSessionDestination *)self->_sessionDestination draggingLocationInCoordinateSpace:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)allowsMoveOperation
{
  return ([(_UIInternalDraggingSessionDestination *)self->_sessionDestination sourceOperationMask] >> 4) & 1;
}

- (BOOL)isRestrictedToDraggingApplication
{
  return ([(_UIInternalDraggingSessionDestination *)self->_sessionDestination outsideAppSourceOperationMask] & 1) == 0;
}

- (BOOL)hasItemsConformingToTypeIdentifiers:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIDropSessionImpl *)self items];
  char hasItemsConformingToTypeIdentifiers = _hasItemsConformingToTypeIdentifiers(v5, v4);

  return hasItemsConformingToTypeIdentifiers;
}

- (BOOL)canLoadObjectsOfClass:(Class)a3
{
  id v4 = [(_UIDropSessionImpl *)self items];
  LOBYTE(a3) = _canLoadObjectsOfClass(v4, (uint64_t)a3);

  return (char)a3;
}

- (CGSize)_previewSizeForVisibleItem:(id)a3
{
  [a3 _visibleDropItemSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)_previewCenterForVisibleItem:(id)a3 inView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIDragSession.m", 568, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  sessionDestination = self->_sessionDestination;
  double v10 = [v8 coordinateSpace];
  [(_UIInternalDraggingSessionDestination *)sessionDestination previewCenterForVisibleItem:v7 inCoordinateSpace:v10];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)setProgressIndicatorStyle:(unint64_t)a3
{
  self->_progressIndicatorStyle = a3;
  -[_UIInternalDraggingSessionDestination setProgressIndicatorStyle:](self->_sessionDestination, "setProgressIndicatorStyle:");
}

- (id)loadObjectsOfClass:(Class)a3 completion:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIDragSession.m", 585, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  id v8 = [(_UIDropSessionImpl *)self _createItemsOfClass:a3 synchronouslyIfPossible:0 completion:v7];

  return v8;
}

- (void)requestVisibleItems:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    sessionDestination = self->_sessionDestination;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42___UIDropSessionImpl_requestVisibleItems___block_invoke;
    v7[3] = &unk_1E52E3BB0;
    v7[4] = self;
    id v8 = v4;
    [(_UIInternalDraggingSessionDestination *)sessionDestination requestVisibleItems:v7];
  }
}

- (unsigned)_sessionIdentifier
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination sessionIdentifier];
}

- (BOOL)_drivenByPointer
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination drivenByPointer];
}

- (unint64_t)_operationMask
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination draggingSourceOperationMask];
}

- (id)_internalSession
{
  return self->_sessionDestination;
}

- (id)_createItemsOfClass:(Class)a3 synchronouslyIfPossible:(BOOL)a4 completion:(id)a5
{
  BOOL v27 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v28 = a5;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v29 = [MEMORY[0x1E4F1CA48] array];
  v30 = dispatch_group_create();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = [(_UIDropSessionImpl *)self items];
  uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = [*(id *)(*((void *)&v44 + 1) + 8 * i) itemProvider];
        if ([v13 canLoadObjectOfClass:a3])
        {
          dispatch_group_enter(v30);
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke;
          v40[3] = &unk_1E52EC0E8;
          double v14 = v7;
          id v41 = v7;
          uint64_t v43 = v10;
          v42 = v30;
          double v15 = [v13 loadObjectOfClass:a3 completionHandler:v40];
          if (v15) {
            [v29 addObject:v15];
          }
          ++v10;

          id v7 = v14;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v9);
  }

  double v16 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v29, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = v29;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        [v16 addChild:*(void *)(*((void *)&v36 + 1) + 8 * j) withPendingUnitCount:1];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v19);
  }

  if (v27 && (dispatch_time_t v22 = dispatch_time(0, 50000000), !dispatch_group_wait(v30, v22)))
  {
    v25 = arrayOfItemsFromDictionaryOfItemsByIndex(v7);
    uint64_t v24 = v28;
    (*((void (**)(id, void *))v28 + 2))(v28, v25);
  }
  else
  {
    v23 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke_2;
    block[3] = &unk_1E52E3298;
    v33 = v30;
    id v34 = v7;
    uint64_t v24 = v28;
    id v35 = v28;
    dispatch_async(v23, block);

    v25 = v33;
  }

  return v16;
}

- (void)_itemsNeedUpdate:(id)a3
{
}

- (BOOL)_allowsItemsToUpdate
{
  v2 = [(_UIDropSessionImpl *)self _internalSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)_dataOwner
{
  return [(_UIInternalDraggingSessionDestination *)self->_sessionDestination sourceDataOwner];
}

- (UIDragSession)localDragSession
{
  return self->_localDragSession;
}

- (unint64_t)progressIndicatorStyle
{
  return self->_progressIndicatorStyle;
}

- (_UIInternalDraggingSessionDestination)sessionDestination
{
  return self->_sessionDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDestination, 0);
  objc_storeStrong((id *)&self->_localDragSession, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end