@interface CRLPKDrawingProvider
+ (id)allDrawingItemsDescendedFromContainer:(id)a3;
+ (id)makePKDrawingFromDrawingItems:(id)a3;
+ (void)p_recursivelyAddFreehandDrawingItemsFromGroup:(id)a3 drawingItems:(id)a4;
- (BOOL)isTornDown;
- (CRLBidirectionalMap)drawingShapeItemUUIDToStrokeUUIDBidirectionalMap;
- (CRLPKDrawingProvider)initWithICC:(id)a3;
- (NSDictionary)strokeUUIDsToDrawingItems;
- (NSDictionary)strokeUUIDsToDrawingShapeItems;
- (NSDictionary)strokeUUIDsToStrokes;
- (id)p_createUUIDFromHashingStrokeTransformForShapeItem:(id)a3;
- (id)p_fetchAllDrawingItemsFromCanvas;
- (id)p_fetchAllShapeItemsFromDrawingItem:(id)a3;
- (id)p_observersWithChangedDrawings;
- (id)p_strokeDataUUIDForDrawingShapeItemUUIDUNSAFE:(id)a3;
- (id)pkStrokesContainingUnlockedDrawingsForEntireCanvas;
- (id)pkStrokesForFreehandDrawingItemID:(id)a3;
- (id)strokeDataUUIDForDrawingShapeItemUUID:(id)a3;
- (void)activeDrawingDidBegin;
- (void)activeDrawingWillEndAfterInsertingFinalizedDrawingItem;
- (void)addConsolidatedPKDrawingObserver:(id)a3;
- (void)addPKDrawingsObserver:(id)a3;
- (void)dealloc;
- (void)didProcessAllChanges;
- (void)p_addSubscriptionsForDrawingItemChanges;
- (void)p_checkIfNeededAndRegisterRecentlyCreatedLocalStroke:(id)a3 drawingShapeItemUUID:(id)a4 updatedDrawingItemUUID:(id)a5;
- (void)p_cleanPKStrokeCachesIfNecessary;
- (void)p_updateConsolidatedObserversIfNeeded;
- (void)p_updateObservers;
- (void)p_updateObserversWithNewPKStrokesIfNeeded;
- (void)p_updateObserversWithUpdatedPKStrokesSynchronously:(BOOL)a3;
- (void)p_updatePKStrokesForShapeItemsIfNeeded:(id)a3 boardIdentifier:(id)a4;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)removeConsolidatedPKDrawingObserver:(id)a3;
- (void)removePKDrawingsObserver:(id)a3;
- (void)setup;
- (void)teardown;
@end

@implementation CRLPKDrawingProvider

- (CRLPKDrawingProvider)initWithICC:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CRLPKDrawingProvider;
  v5 = [(CRLPKDrawingProvider *)&v42 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    drawingParentIdsToShapeItemsBeingListenedTo = v6->_drawingParentIdsToShapeItemsBeingListenedTo;
    v6->_drawingParentIdsToShapeItemsBeingListenedTo = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uuidsForUnlockedDrawingItems = v6->_uuidsForUnlockedDrawingItems;
    v6->_uuidsForUnlockedDrawingItems = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    shapeItemIdToParentItemId = v6->_shapeItemIdToParentItemId;
    v6->_shapeItemIdToParentItemId = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedPKStrokesForDrawingItems = v6->_cachedPKStrokesForDrawingItems;
    v6->_cachedPKStrokesForDrawingItems = v13;

    v15 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    cachedPKStrokesForDrawingItemsOrderedKeys = v6->_cachedPKStrokesForDrawingItemsOrderedKeys;
    v6->_cachedPKStrokesForDrawingItemsOrderedKeys = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    changedPKStrokesForDrawingItemIds = v6->_changedPKStrokesForDrawingItemIds;
    v6->_changedPKStrokesForDrawingItemIds = v17;

    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    drawingItemsNeedingUpdatedPKStrokes = v6->_drawingItemsNeedingUpdatedPKStrokes;
    v6->_drawingItemsNeedingUpdatedPKStrokes = v19;

    v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    drawingItemsNeedingRemovedPKStrokes = v6->_drawingItemsNeedingRemovedPKStrokes;
    v6->_drawingItemsNeedingRemovedPKStrokes = v21;

    v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observers = v6->_observers;
    v6->_observers = v23;

    v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observersWantingConsolidatedPKDrawing = v6->_observersWantingConsolidatedPKDrawing;
    v6->_observersWantingConsolidatedPKDrawing = v25;

    v27 = objc_alloc_init(CRLBidirectionalMap);
    cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = v6->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
    v6->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = v27;

    v29 = objc_alloc_init(CRLBidirectionalMap);
    cachedDrawingShapeItemUUIDToStrokeUUIDDict = v6->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
    v6->_cachedDrawingShapeItemUUIDToStrokeUUIDDict = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    updatedParentUUIDToDrawingShapeItemUUIDsDict = v6->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
    v6->_updatedParentUUIDToDrawingShapeItemUUIDsDict = v31;

    v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    strokeUUIDsToDrawingItems = v6->_strokeUUIDsToDrawingItems;
    v6->_strokeUUIDsToDrawingItems = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    strokeUUIDsToDrawingShapeItems = v6->_strokeUUIDsToDrawingShapeItems;
    v6->_strokeUUIDsToDrawingShapeItems = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    strokeUUIDsToStrokes = v6->_strokeUUIDsToStrokes;
    v6->_strokeUUIDsToStrokes = v37;

    *(_WORD *)&v6->_shouldUpdateObservers = 1;
    v6->_updatePKStrokesLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
    v39 = [[_TtC8Freeform25CRLLastSubmittedTaskQueue alloc] initWithLabel:@"com.apple.freeform.pk-drawing-provider.task.queue"];
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = v39;

    [(CRLPKDrawingProvider *)v6 setup];
  }

  return v6;
}

- (NSDictionary)strokeUUIDsToDrawingItems
{
  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  id v4 = self->_strokeUUIDsToDrawingItems;
  os_unfair_lock_unlock(p_updatePKStrokesLock);

  return (NSDictionary *)v4;
}

- (NSDictionary)strokeUUIDsToDrawingShapeItems
{
  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  id v4 = self->_strokeUUIDsToDrawingShapeItems;
  os_unfair_lock_unlock(p_updatePKStrokesLock);

  return (NSDictionary *)v4;
}

- (NSDictionary)strokeUUIDsToStrokes
{
  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  id v4 = self->_strokeUUIDsToStrokes;
  os_unfair_lock_unlock(p_updatePKStrokesLock);

  return (NSDictionary *)v4;
}

- (CRLBidirectionalMap)drawingShapeItemUUIDToStrokeUUIDBidirectionalMap
{
  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  id v4 = self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
  os_unfair_lock_unlock(p_updatePKStrokesLock);

  return v4;
}

- (void)setup
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v5 = [WeakRetained changeNotifier];
  [v5 addObserver:self forChangeSourceOfClass:objc_opt_class()];

  id v6 = objc_loadWeakRetained((id *)p_icc);
  v7 = [v6 changeNotifier];
  [v7 addObserver:self forChangeSourceOfClass:objc_opt_class()];

  id v8 = objc_loadWeakRetained((id *)p_icc);
  v9 = [v8 changeNotifier];
  [v9 addObserver:self forChangeSourceOfClass:objc_opt_class()];

  [(CRLPKDrawingProvider *)self p_addSubscriptionsForDrawingItemChanges];

  [(CRLPKDrawingProvider *)self p_updateObserversWithUpdatedPKStrokesSynchronously:1];
}

- (void)addPKDrawingsObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    -[NSMutableSet addObject:](observers, "addObject:");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2740);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108C22C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2760);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider addPKDrawingsObserver:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:186 isFatal:0 description:"Trying to add a nil observer with addObserver:"];
  }
}

- (void)removePKDrawingsObserver:(id)a3
{
}

- (void)addConsolidatedPKDrawingObserver:(id)a3
{
  if (a3)
  {
    observersWantingConsolidatedPKDrawing = self->_observersWantingConsolidatedPKDrawing;
    -[NSMutableSet addObject:](observersWantingConsolidatedPKDrawing, "addObject:");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2780);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108C2B4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E27A0);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider addConsolidatedPKDrawingObserver:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:198 isFatal:0 description:"Trying to add a nil observer with addConsolidatedPKDrawingObserver:"];
  }
}

- (void)removeConsolidatedPKDrawingObserver:(id)a3
{
}

- (void)activeDrawingDidBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v4 = [WeakRetained freehandDrawingToolkit];
  v5 = [v4 currentTool];
  id v6 = [v5 type];

  if (v6 != (id)9) {
    self->_shouldUpdateObservers = 0;
  }
}

- (void)activeDrawingWillEndAfterInsertingFinalizedDrawingItem
{
  self->_shouldUpdateObservers = 1;
}

+ (id)allDrawingItemsDescendedFromContainer:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = v4;
  id v6 = [v4 childInfos];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        v13 = sub_1002469D0(v12, v11);
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = sub_1002469D0(v14, v11);
        v16 = (void *)v15;
        if (v13)
        {
          [v5 addObject:v13];
        }
        else if (v15)
        {
          [a1 p_recursivelyAddFreehandDrawingItemsFromGroup:v15 drawingItems:v5];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)makePKDrawingFromDrawingItems:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v3;
  id v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v42;
    p_base_prots = &CRLBoardDataStore.base_prots;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        id v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v31 = [v7 allNestedChildrenItemsExcludingGroups];
        id v8 = [v31 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v38;
          uint64_t v30 = *(void *)v38;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v38 != v10) {
                objc_enumerationMutation(v31);
              }
              uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              uint64_t v13 = objc_opt_class();
              uint64_t v14 = sub_1002469D0(v13, v12);
              uint64_t v15 = v14;
              if (v14 && ([v14 isTreatedAsFillForFreehandDrawing] & 1) == 0)
              {
                v16 = p_base_prots;
                long long v35 = 0u;
                long long v36 = 0u;
                long long v33 = 0u;
                long long v34 = 0u;
                v17 = [v15 pencilKitStrokes];
                id v18 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v18)
                {
                  id v19 = v18;
                  uint64_t v20 = *(void *)v34;
                  do
                  {
                    for (j = 0; j != v19; j = (char *)j + 1)
                    {
                      if (*(void *)v34 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      long long v22 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
                      [v15 transformInRoot];
                      v23 = [v22 crl_strokeByAppendingTransform:v32];
                      [v4 addObject:v23];
                    }
                    id v19 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  }
                  while (v19);
                }

                p_base_prots = v16;
                uint64_t v10 = v30;
              }
            }
            id v9 = [v31 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v28);
  }

  id v24 = [objc_alloc((Class)PKDrawing) initWithStrokes:v4];

  return v24;
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v7 = sub_1002469D0(v6, v5);
  uint64_t v8 = objc_opt_class();
  id v9 = sub_1002469D0(v8, v5);
  uint64_t v10 = objc_opt_class();
  v11 = sub_1002469D0(v10, v5);
  if (v7 && ([v7 prohibitsClustering] & 1) == 0)
  {
    if ([v7 isInBoard])
    {
      drawingParentIdsToShapeItemsBeingListenedTo = self->_drawingParentIdsToShapeItemsBeingListenedTo;
      v23 = [v7 id];
      id v24 = [(NSMutableDictionary *)drawingParentIdsToShapeItemsBeingListenedTo objectForKeyedSubscript:v23];

      if (!v24)
      {
        id v77 = v5;
        v79 = v11;
        v25 = [v7 childItems];
        v26 = +[NSMutableSet setWithArray:v25];
        uint64_t v27 = self->_drawingParentIdsToShapeItemsBeingListenedTo;
        id v28 = [v7 id];
        [(NSMutableDictionary *)v27 setObject:v26 forKeyedSubscript:v28];

        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        uint64_t v29 = [v7 childItems];
        id v30 = [v29 countByEnumeratingWithState:&v90 objects:v96 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v91;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v91 != v32) {
                objc_enumerationMutation(v29);
              }
              long long v34 = *(void **)(*((void *)&v90 + 1) + 8 * i);
              long long v35 = [v7 id];
              shapeItemIdToParentItemId = self->_shapeItemIdToParentItemId;
              long long v37 = [v34 id];
              [(NSMutableDictionary *)shapeItemIdToParentItemId setObject:v35 forKeyedSubscript:v37];
            }
            id v31 = [v29 countByEnumeratingWithState:&v90 objects:v96 count:16];
          }
          while (v31);
        }

        id v5 = v77;
        v11 = v79;
      }
      unsigned int v38 = [v7 locked];
      uuidsForUnlockedDrawingItems = self->_uuidsForUnlockedDrawingItems;
      long long v40 = [v7 id];
      if (v38) {
        [(NSMutableSet *)uuidsForUnlockedDrawingItems removeObject:v40];
      }
      else {
        [(NSMutableSet *)uuidsForUnlockedDrawingItems addObject:v40];
      }

      os_unfair_lock_lock(&self->_updatePKStrokesLock);
      [(NSMutableSet *)self->_drawingItemsNeedingUpdatedPKStrokes addObject:v7];
      os_unfair_lock_unlock(&self->_updatePKStrokesLock);
    }
    else
    {
      v81 = v11;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      v64 = [v7 childItems];
      id v65 = [v64 countByEnumeratingWithState:&v86 objects:v95 count:16];
      if (v65)
      {
        id v66 = v65;
        uint64_t v67 = *(void *)v87;
        do
        {
          for (j = 0; j != v66; j = (char *)j + 1)
          {
            if (*(void *)v87 != v67) {
              objc_enumerationMutation(v64);
            }
            v69 = self->_shapeItemIdToParentItemId;
            v70 = [*(id *)(*((void *)&v86 + 1) + 8 * (void)j) id];
            [(NSMutableDictionary *)v69 setObject:0 forKeyedSubscript:v70];
          }
          id v66 = [v64 countByEnumeratingWithState:&v86 objects:v95 count:16];
        }
        while (v66);
      }

      v71 = self->_drawingParentIdsToShapeItemsBeingListenedTo;
      v72 = [v7 id];
      [(NSMutableDictionary *)v71 setObject:0 forKeyedSubscript:v72];

      v73 = self->_uuidsForUnlockedDrawingItems;
      v74 = [v7 id];
      [(NSMutableSet *)v73 removeObject:v74];

      [(NSMutableSet *)self->_drawingItemsNeedingRemovedPKStrokes addObject:v7];
      v11 = v81;
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = [v9 parentItem];
      uint64_t v14 = sub_1002469D0(v12, v13);

      if (!v14) {
        goto LABEL_27;
      }
      if ([v14 prohibitsClustering])
      {
LABEL_42:

        goto LABEL_53;
      }
      if (![v14 isInBoard]
        || ([v9 isInBoard] & 1) == 0
        && ![v9 isTreatedAsFillForFreehandDrawing])
      {
LABEL_27:
        id v78 = v5;
        v80 = v11;
        long long v42 = self->_shapeItemIdToParentItemId;
        long long v43 = [v9 id];
        uint64_t v44 = [(NSMutableDictionary *)v42 objectForKeyedSubscript:v43];

        v45 = self->_shapeItemIdToParentItemId;
        v46 = [v9 id];
        [(NSMutableDictionary *)v45 setObject:0 forKeyedSubscript:v46];

        if (v44)
        {
          v47 = [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo objectForKeyedSubscript:v44];
          [v47 removeObject:v9];

          v48 = [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo objectForKeyedSubscript:v44];
          id v49 = [v48 count];

          if (!v49) {
            [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo setObject:0 forKeyedSubscript:v44];
          }
        }
        v75 = (void *)v44;
        v76 = v14;
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
        v51 = [v9 id];
        [(CRLBidirectionalMap *)cachedDrawingShapeItemUUIDToStrokeDataUUIDDict setObject:0 forKeyedSubscript:v51];

        cachedDrawingShapeItemUUIDToStrokeUUIDDict = self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
        v53 = [v9 id];
        v54 = [(CRLBidirectionalMap *)cachedDrawingShapeItemUUIDToStrokeUUIDDict objectForKeyedSubscript:v53];

        if (v54)
        {
          [(NSMutableDictionary *)self->_strokeUUIDsToDrawingItems setObject:0 forKeyedSubscript:v54];
          [(NSMutableDictionary *)self->_strokeUUIDsToDrawingShapeItems setObject:0 forKeyedSubscript:v54];
          [(NSMutableDictionary *)self->_strokeUUIDsToStrokes setObject:0 forKeyedSubscript:v54];
          v55 = self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
          v56 = [v9 id];
          [(CRLBidirectionalMap *)v55 setObject:0 forKeyedSubscript:v56];
        }
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        v57 = self->_observers;
        id v58 = [(NSMutableSet *)v57 countByEnumeratingWithState:&v82 objects:v94 count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v60 = *(void *)v83;
          do
          {
            for (k = 0; k != v59; k = (char *)k + 1)
            {
              if (*(void *)v83 != v60) {
                objc_enumerationMutation(v57);
              }
              v62 = *(void **)(*((void *)&v82 + 1) + 8 * (void)k);
              if (objc_opt_respondsToSelector())
              {
                v63 = [v9 id];
                [v62 removeDrawingShapeItemUUIDToStrokeDataUUIDPair:v63];
              }
            }
            id v59 = [(NSMutableSet *)v57 countByEnumeratingWithState:&v82 objects:v94 count:16];
          }
          while (v59);
        }

        id v5 = v78;
        v11 = v80;
        uint64_t v14 = v76;
        goto LABEL_42;
      }
      if ([v9 isTreatedAsFillForFreehandDrawing])
      {
LABEL_57:
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        [(NSMutableSet *)self->_drawingItemsNeedingUpdatedPKStrokes addObject:v14];
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        goto LABEL_42;
      }
      uint64_t v15 = [v9 parentUUID];
      v16 = self->_shapeItemIdToParentItemId;
      v17 = [v9 id];
      [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

      id v18 = [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo objectForKeyedSubscript:v15];

      if (v18)
      {
        id v19 = [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo objectForKeyedSubscript:v15];
        unsigned __int8 v20 = [v19 containsObject:v9];

        if (v20)
        {
LABEL_56:

          goto LABEL_57;
        }
        long long v21 = [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo objectForKeyedSubscript:v15];
        [v21 addObject:v9];
      }
      else
      {
        long long v21 = +[NSMutableSet setWithObject:v9];
        [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo setObject:v21 forKeyedSubscript:v15];
      }

      goto LABEL_56;
    }
    if (v11)
    {
      long long v41 = +[NSMutableArray array];
      [objc_opt_class() p_recursivelyAddFreehandDrawingItemsFromGroup:v11 drawingItems:v41];
      os_unfair_lock_lock(&self->_updatePKStrokesLock);
      [(NSMutableSet *)self->_drawingItemsNeedingUpdatedPKStrokes addObjectsFromArray:v41];
      os_unfair_lock_unlock(&self->_updatePKStrokesLock);
    }
  }
LABEL_53:
}

- (void)didProcessAllChanges
{
}

- (void)teardown
{
  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E27C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108C33C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E27E0);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v2);
    }
    id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider teardown]");
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:374 isFatal:0 description:"attempting to call teardown on an instance of CRLPKDrawingProvider that has already been torn down"];
  }
  else
  {
    self->_isTornDown = 1;
    p_icc = &self->_icc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    uint64_t v8 = [WeakRetained changeNotifier];
    [v8 removeObserver:self forChangeSourceOfClass:objc_opt_class()];

    id v9 = objc_loadWeakRetained((id *)p_icc);
    uint64_t v10 = [v9 changeNotifier];
    [v10 removeObserver:self forChangeSourceOfClass:objc_opt_class()];

    id v11 = objc_loadWeakRetained((id *)p_icc);
    uint64_t v12 = [v11 changeNotifier];
    [v12 removeObserver:self forChangeSourceOfClass:objc_opt_class()];

    [(NSMutableSet *)self->_observers removeAllObjects];
    [(NSMutableSet *)self->_observersWantingConsolidatedPKDrawing removeAllObjects];
    [(NSMutableDictionary *)self->_drawingParentIdsToShapeItemsBeingListenedTo removeAllObjects];
    [(NSMutableSet *)self->_uuidsForUnlockedDrawingItems removeAllObjects];
    shapeItemIdToParentItemId = self->_shapeItemIdToParentItemId;
    [(NSMutableDictionary *)shapeItemIdToParentItemId removeAllObjects];
  }
}

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2800);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108C3C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2820);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider dealloc]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:379 isFatal:0 description:"teardown not called for CRLPKDrawingProvider"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLPKDrawingProvider;
  [(CRLPKDrawingProvider *)&v6 dealloc];
}

- (id)pkStrokesForFreehandDrawingItemID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSArray);
  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  id v7 = [(NSMutableDictionary *)self->_cachedPKStrokesForDrawingItems objectForKeyedSubscript:v4];

  if (v7)
  {
    id v8 = v7;

    id v5 = v8;
  }
  os_unfair_lock_unlock(p_updatePKStrokesLock);

  return v5;
}

- (id)pkStrokesContainingUnlockedDrawingsForEntireCanvas
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_t lock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_cachedPKStrokesForDrawingItemsOrderedKeys;
  id v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v20 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v8);
        if ([(NSMutableSet *)self->_uuidsForUnlockedDrawingItems containsObject:v9])
        {
          uint64_t v10 = [(NSMutableDictionary *)self->_cachedPKStrokesForDrawingItems objectForKeyedSubscript:v9];
          if (v10)
          {
            [v3 addObjectsFromArray:v10];
          }
          else
          {
            unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E2840);
            }
            uint64_t v12 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v25 = v11;
              __int16 v26 = 2082;
              uint64_t v27 = "-[CRLPKDrawingProvider pkStrokesContainingUnlockedDrawingsForEntireCanvas]";
              __int16 v28 = 2082;
              uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m";
              __int16 v30 = 1024;
              int v31 = 401;
              __int16 v32 = 2082;
              long long v33 = "strokes";
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E2860);
            }
            uint64_t v13 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v16 = v13;
              v17 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v25 = v11;
              __int16 v26 = 2114;
              uint64_t v27 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider pkStrokesContainingUnlockedDrawingsForEntireCanvas]");
            uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 401, 0, "invalid nil value for '%{public}s'", "strokes", lock);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v20 objects:v34 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);

  return v3;
}

- (id)strokeDataUUIDForDrawingShapeItemUUID:(id)a3
{
  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_updatePKStrokesLock);
  id v6 = [(CRLBidirectionalMap *)self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_updatePKStrokesLock);

  return v6;
}

- (void)p_updateObserversWithUpdatedPKStrokesSynchronously:(BOOL)a3
{
  BOOL v25 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v4 = [WeakRetained board];
  int v31 = [v4 id];

  __int16 v28 = +[NSMutableArray array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = self->_drawingItemsNeedingUpdatedPKStrokes;
  id v29 = [(NSMutableSet *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v47;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v47 != v27) {
          objc_enumerationMutation(obj);
        }
        long long v33 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        __int16 v32 = +[NSMutableArray array];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v5 = [v33 childItems];
        id v6 = [v5 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v43;
          do
          {
            for (j = 0; j != v6; j = (char *)j + 1)
            {
              if (*(void *)v43 != v7) {
                objc_enumerationMutation(v5);
              }
              uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
              uint64_t v10 = objc_opt_class();
              unsigned int v11 = sub_1002469D0(v10, v9);
              uint64_t v12 = v11;
              if (v11 && ([v11 isTreatedAsFillForFreehandDrawing] & 1) == 0)
              {
                uint64_t v13 = [(CRLPKDrawingProvider *)self p_createUUIDFromHashingStrokeTransformForShapeItem:v12];
                uint64_t v14 = [CRLShapeItemNeedingPKStrokeUpdate alloc];
                uint64_t v15 = [v9 id];
                [v12 transformInRoot];
                v16 = [v12 pencilKitStrokes];
                v17 = [(CRLShapeItemNeedingPKStrokeUpdate *)v14 initWith:v15 strokeTransformInfoUUID:v13 transformInRoot:v41 pkStrokes:v16];

                [v32 addObject:v17];
                id v18 = [v12 id];
                id v19 = [v18 combineUUIDWithUUID:v13];
                long long v20 = [v12 pencilKitStrokes];
                v40[0] = _NSConcreteStackBlock;
                v40[1] = 3221225472;
                v40[2] = sub_10020CFEC;
                v40[3] = &unk_1014E2888;
                v40[4] = v19;
                v40[5] = v31;
                v40[6] = self;
                v40[7] = v12;
                v40[8] = v33;
                [v20 enumerateObjectsUsingBlock:v40];
              }
            }
            id v6 = [v5 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v6);
        }

        long long v21 = [CRLDrawingItemNeedingPKStrokeUpdate alloc];
        long long v22 = [v33 id];
        long long v23 = [(CRLDrawingItemNeedingPKStrokeUpdate *)v21 initWith:v22 shapeItems:v32];
        [v28 addObject:v23];
      }
      id v29 = [(NSMutableSet *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v29);
  }

  if (v25)
  {
    [(CRLPKDrawingProvider *)self p_updatePKStrokesForShapeItemsIfNeeded:v28 boardIdentifier:v31];
    [(CRLPKDrawingProvider *)self p_updateObservers];
  }
  else
  {
    objc_initWeak(&location, self);
    taskQueue = self->_taskQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10020D114;
    v35[3] = &unk_1014E28B0;
    objc_copyWeak(&v38, &location);
    v35[4] = self;
    id v36 = v28;
    long long v37 = v31;
    [(CRLLastSubmittedTaskQueue *)taskQueue performAsync:v35];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
}

- (void)p_updateObservers
{
  if (self->_shouldUpdateObservers)
  {
    [(CRLPKDrawingProvider *)self p_updateObserversWithNewPKStrokesIfNeeded];
    [(CRLPKDrawingProvider *)self p_updateConsolidatedObserversIfNeeded];
  }
}

- (void)p_updateConsolidatedObserversIfNeeded
{
  if ([(NSMutableSet *)self->_observersWantingConsolidatedPKDrawing count])
  {
    id v3 = [(CRLPKDrawingProvider *)self pkStrokesContainingUnlockedDrawingsForEntireCanvas];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_observersWantingConsolidatedPKDrawing;
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) pkStrokesContainingUnlockedDrawingsForEntireCanvasDidChange:v3];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)p_strokeDataUUIDForDrawingShapeItemUUIDUNSAFE:(id)a3
{
  return [(CRLBidirectionalMap *)self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict objectForKeyedSubscript:a3];
}

- (void)p_updateObserversWithNewPKStrokesIfNeeded
{
  id v3 = [(CRLPKDrawingProvider *)self p_observersWithChangedDrawings];
  id v4 = [v3 keyEnumerator];
  id v5 = [v4 allObjects];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v6 = v5;
  uint64_t v7 = v3;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v8)
  {
    id v10 = v8;
    p_updatePKStrokesLock = &self->_updatePKStrokesLock;
    p_vtable = CRLiOSImageHUDSlider.vtable;
    uint64_t v50 = *(void *)v69;
    *(void *)&long long v9 = 67109378;
    long long v45 = v9;
    long long v46 = v3;
    do
    {
      uint64_t v13 = 0;
      id v47 = v10;
      do
      {
        if (*(void *)v69 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v13);
        uint64_t v15 = [v7 objectForKeyedSubscript:v14, v45];
        v52 = v15;
        if (v15 && (v16 = v15, [v15 count]))
        {
          v51 = v14;
          long long v49 = v13;
          id v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v16, "count"));
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v18 = v16;
          id v19 = [v18 countByEnumeratingWithState:&v64 objects:v82 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v65;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v65 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v64 + 1) + 8 * i);
                id v24 = [(CRLPKDrawingProvider *)self pkStrokesForFreehandDrawingItemID:v23];
                if (v24) {
                  [v17 setObject:v24 forKeyedSubscript:v23];
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v64 objects:v82 count:16];
            }
            while (v20);
          }

          [v51 pkStrokesForFreehandItemsDidChange:v17];
          BOOL v25 = objc_alloc_init(CRLBidirectionalMap);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v26 = v17;
          id v53 = v26;
          id v55 = [v26 countByEnumeratingWithState:&v60 objects:v81 count:16];
          if (v55)
          {
            uint64_t v54 = *(void *)v61;
            do
            {
              for (j = 0; j != v55; j = (char *)j + 1)
              {
                if (*(void *)v61 != v54) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v28 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
                os_unfair_lock_lock(p_updatePKStrokesLock);
                id v29 = [(NSMutableDictionary *)self->_updatedParentUUIDToDrawingShapeItemUUIDsDict objectForKeyedSubscript:v28];

                if (v29)
                {
                  __int16 v30 = p_updatePKStrokesLock;
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v56 = 0u;
                  long long v57 = 0u;
                  int v31 = [(NSMutableDictionary *)self->_updatedParentUUIDToDrawingShapeItemUUIDsDict objectForKeyedSubscript:v28];
                  id v32 = [v31 countByEnumeratingWithState:&v56 objects:v80 count:16];
                  if (v32)
                  {
                    id v33 = v32;
                    uint64_t v34 = *(void *)v57;
                    do
                    {
                      for (k = 0; k != v33; k = (char *)k + 1)
                      {
                        if (*(void *)v57 != v34) {
                          objc_enumerationMutation(v31);
                        }
                        uint64_t v36 = *(void *)(*((void *)&v56 + 1) + 8 * (void)k);
                        long long v37 = [(CRLPKDrawingProvider *)self p_strokeDataUUIDForDrawingShapeItemUUIDUNSAFE:v36];
                        [(CRLBidirectionalMap *)v25 setObject:v37 forKeyedSubscript:v36];
                      }
                      id v33 = [v31 countByEnumeratingWithState:&v56 objects:v80 count:16];
                    }
                    while (v33);
                  }

                  p_updatePKStrokesLock = v30;
                }
                os_unfair_lock_unlock(p_updatePKStrokesLock);
              }
              id v26 = v53;
              id v55 = [v53 countByEnumeratingWithState:&v60 objects:v81 count:16];
            }
            while (v55);
          }

          p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
          if (objc_opt_respondsToSelector()) {
            [v51 updateDrawingShapeItemUUIDToStrokeDataUUIDDict:v25];
          }
          uint64_t v7 = v46;
          id v10 = v47;
          uint64_t v13 = v49;
          id v38 = v53;
        }
        else
        {
          long long v39 = v7;
          unsigned int v40 = [p_vtable + 152 _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E28D0);
          }
          long long v41 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v73 = v40;
            __int16 v74 = 2082;
            v75 = "-[CRLPKDrawingProvider p_updateObserversWithNewPKStrokesIfNeeded]";
            __int16 v76 = 2082;
            id v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m";
            __int16 v78 = 1024;
            int v79 = 533;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d CRLPKDrawingProvider - p_updateObservers failed to retrieve changedIds for observer", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E28F0);
          }
          long long v42 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            long long v43 = v42;
            long long v44 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v45;
            unsigned int v73 = v40;
            __int16 v74 = 2114;
            v75 = v44;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
          }
          id v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider p_updateObserversWithNewPKStrokesIfNeeded]");
          BOOL v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"];
          [p_vtable + 152 handleFailureInFunction:v38 file:v25 lineNumber:533 isFatal:0 description:"CRLPKDrawingProvider - p_updateObservers failed to retrieve changedIds for observer"];
          uint64_t v7 = v39;
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      id v10 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v10);
  }

  [(CRLPKDrawingProvider *)self p_cleanPKStrokeCachesIfNecessary];
}

- (void)p_cleanPKStrokeCachesIfNecessary
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self->_drawingItemsNeedingRemovedPKStrokes;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        cachedPKStrokesForDrawingItems = self->_cachedPKStrokesForDrawingItems;
        id v10 = [v8 id:v13];
        [(NSMutableDictionary *)cachedPKStrokesForDrawingItems removeObjectForKey:v10];

        cachedPKStrokesForDrawingItemsOrderedKeys = self->_cachedPKStrokesForDrawingItemsOrderedKeys;
        long long v12 = [v8 id];
        [(NSMutableOrderedSet *)cachedPKStrokesForDrawingItemsOrderedKeys removeObject:v12];

        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  [(NSMutableSet *)self->_drawingItemsNeedingUpdatedPKStrokes removeAllObjects];
  [(NSMutableSet *)self->_drawingItemsNeedingRemovedPKStrokes removeAllObjects];
  [(NSMutableDictionary *)self->_changedPKStrokesForDrawingItemIds removeAllObjects];
  os_unfair_lock_unlock(&self->_updatePKStrokesLock);
}

- (id)p_observersWithChangedDrawings
{
  id v13 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:-[NSMutableSet count](self->_observers, "count")];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_observers;
  id v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = [v7 subscribedFreehandDrawingIDs];
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        changedPKStrokesForDrawingItemIds = self->_changedPKStrokesForDrawingItemIds;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10020DD80;
        v15[3] = &unk_1014E2918;
        id v10 = v8;
        id v16 = v10;
        long long v11 = [(NSMutableDictionary *)changedPKStrokesForDrawingItemIds keysOfEntriesPassingTest:v15];
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        if (v11 && [v11 count]) {
          [v13 setObject:v11 forKeyedSubscript:v7];
        }
      }
      id v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v13;
}

- (void)p_updatePKStrokesForShapeItemsIfNeeded:(id)a3 boardIdentifier:(id)a4
{
  id v6 = a3;
  id v73 = a4;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = v6;
  v80 = self;
  id v65 = [v6 countByEnumeratingWithState:&v98 objects:v105 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v99;
    p_updatePKStrokesLock = &self->_updatePKStrokesLock;
    os_unfair_lock_t lock = &self->_updatePKStrokesLock;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v99 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v66 = v8;
        long long v9 = *(void **)(*((void *)&v98 + 1) + 8 * v8);
        id v74 = objc_alloc_init((Class)NSMutableArray);
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        v81 = v9;
        id v67 = [v9 shapeItems];
        id v69 = [v67 countByEnumeratingWithState:&v94 objects:v104 count:16];
        if (v69)
        {
          uint64_t v68 = *(void *)v95;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v95 != v68) {
                objc_enumerationMutation(v67);
              }
              uint64_t v70 = v10;
              long long v11 = *(void **)(*((void *)&v94 + 1) + 8 * v10);
              long long v12 = [v11 id];
              id v13 = [v11 strokeTransformInfoUUID];
              __int16 v76 = [v12 combineUUIDWithUUID:v13];

              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              id v71 = [v11 pkStrokes];
              id v77 = [v71 countByEnumeratingWithState:&v90 objects:v103 count:16];
              if (v77)
              {
                uint64_t v78 = 0;
                uint64_t v75 = *(void *)v91;
                do
                {
                  for (i = 0; i != v77; i = (char *)i + 1)
                  {
                    if (*(void *)v91 != v75) {
                      objc_enumerationMutation(v71);
                    }
                    long long v15 = *(void **)(*((void *)&v90 + 1) + 8 * i);
                    uint64_t v16 = [v76 combineUUIDWithUUID:v73 mixValue:(char *)i + v78];
                    long long v17 = [v76 combineUUIDWithUUID:v73 mixValue:(v78 + i + 500)];
                    long long v18 = [v15 path];
                    id v82 = [v18 copyWithStrokeDataUUID:v16];

                    id v19 = objc_alloc((Class)PKStroke);
                    long long v20 = [v15 ink];
                    if (v15) {
                      [v15 transform];
                    }
                    else {
                      memset(v89, 0, sizeof(v89));
                    }
                    uint64_t v21 = [v15 mask];
                    id v22 = [v19 initWithInk:v20 strokePath:v82 transform:v89 mask:v21 randomSeed:[v15 randomSeed]];

                    int v79 = (void *)v16;
                    if (v11) {
                      [v11 transformInRoot];
                    }
                    else {
                      memset(v88, 0, sizeof(v88));
                    }
                    uint64_t v23 = [v22 crl_strokeByAppendingTransform:v88];
                    [v23 renderBounds];
                    os_unfair_lock_lock(p_updatePKStrokesLock);
                    id v24 = [v23 path];
                    BOOL v25 = [v24 _strokeDataUUID];
                    cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
                    uint64_t v27 = [v11 id];
                    [(CRLBidirectionalMap *)cachedDrawingShapeItemUUIDToStrokeDataUUIDDict setObject:v25 forKeyedSubscript:v27];

                    updatedParentUUIDToDrawingShapeItemUUIDsDict = v80->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
                    id v29 = [v81 id];
                    __int16 v30 = [(NSMutableDictionary *)updatedParentUUIDToDrawingShapeItemUUIDsDict objectForKeyedSubscript:v29];

                    if (v30)
                    {
                      int v31 = v80->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
                      id v32 = [v81 id];
                      id v33 = [(NSMutableDictionary *)v31 objectForKeyedSubscript:v32];
                      uint64_t v34 = [v11 id];
                      [v33 addObject:v34];
                    }
                    else
                    {
                      id v35 = objc_alloc((Class)NSMutableSet);
                      id v32 = [v11 id];
                      id v33 = [v35 initWithObjects:v32, 0];
                      uint64_t v36 = v80->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
                      uint64_t v34 = [v81 id];
                      [(NSMutableDictionary *)v36 setObject:v33 forKeyedSubscript:v34];
                    }

                    id v37 = objc_alloc((Class)PKStroke);
                    id v38 = [v23 path];
                    id v39 = [v15 _flags];
                    unsigned int v40 = [v15 ink];
                    if (v23) {
                      [v23 transform];
                    }
                    else {
                      memset(v87, 0, sizeof(v87));
                    }
                    id v41 = [v37 initWithData:v38 id:v17 flags:v39 ink:v40 transform:v87 substrokes:&__NSArray0__struct];

                    long long v42 = [v11 id];
                    long long v43 = [v81 id];
                    self = v80;
                    [(CRLPKDrawingProvider *)v80 p_checkIfNeededAndRegisterRecentlyCreatedLocalStroke:v41 drawingShapeItemUUID:v42 updatedDrawingItemUUID:v43];

                    [v41 renderBounds];
                    [(NSMutableDictionary *)v80->_strokeUUIDsToStrokes setObject:v41 forKeyedSubscript:v17];
                    long long v44 = [v41 _strokeUUID];
                    cachedDrawingShapeItemUUIDToStrokeUUIDDict = v80->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
                    long long v46 = [v11 id];
                    [(CRLBidirectionalMap *)cachedDrawingShapeItemUUIDToStrokeUUIDDict setObject:v44 forKeyedSubscript:v46];

                    p_updatePKStrokesLock = lock;
                    os_unfair_lock_unlock(lock);
                    [v74 addObject:v41];
                  }
                  id v77 = [v71 countByEnumeratingWithState:&v90 objects:v103 count:16];
                  uint64_t v78 = (v78 + i);
                }
                while (v77);
              }

              uint64_t v10 = v70 + 1;
            }
            while ((id)(v70 + 1) != v69);
            id v69 = [v67 countByEnumeratingWithState:&v94 objects:v104 count:16];
          }
          while (v69);
        }

        os_unfair_lock_lock(p_updatePKStrokesLock);
        changedPKStrokesForDrawingItemIds = self->_changedPKStrokesForDrawingItemIds;
        long long v48 = [v81 id];
        [(NSMutableDictionary *)changedPKStrokesForDrawingItemIds setObject:v74 forKeyedSubscript:v48];

        cachedPKStrokesForDrawingItems = self->_cachedPKStrokesForDrawingItems;
        uint64_t v50 = [v81 id];
        [(NSMutableDictionary *)cachedPKStrokesForDrawingItems setObject:v74 forKeyedSubscript:v50];

        cachedPKStrokesForDrawingItemsOrderedKeys = self->_cachedPKStrokesForDrawingItemsOrderedKeys;
        v52 = [v81 id];
        LOBYTE(cachedPKStrokesForDrawingItemsOrderedKeys) = [(NSMutableOrderedSet *)cachedPKStrokesForDrawingItemsOrderedKeys containsObject:v52];

        if ((cachedPKStrokesForDrawingItemsOrderedKeys & 1) == 0)
        {
          id v53 = self->_cachedPKStrokesForDrawingItemsOrderedKeys;
          uint64_t v54 = [v81 id];
          [(NSMutableOrderedSet *)v53 addObject:v54];
        }
        os_unfair_lock_unlock(p_updatePKStrokesLock);

        uint64_t v8 = v66 + 1;
      }
      while ((id)(v66 + 1) != v65);
      id v65 = [obj countByEnumeratingWithState:&v98 objects:v105 count:16];
    }
    while (v65);
  }
  id v55 = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v56 = self->_drawingItemsNeedingRemovedPKStrokes;
  id v57 = [(NSMutableSet *)v56 countByEnumeratingWithState:&v83 objects:v102 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v84;
    do
    {
      for (j = 0; j != v58; j = (char *)j + 1)
      {
        if (*(void *)v84 != v59) {
          objc_enumerationMutation(v56);
        }
        long long v61 = v80->_changedPKStrokesForDrawingItemIds;
        long long v62 = [*(id *)(*((void *)&v83 + 1) + 8 * (void)j) id];
        [(NSMutableDictionary *)v61 setObject:&__NSArray0__struct forKeyedSubscript:v62];
      }
      id v58 = [(NSMutableSet *)v56 countByEnumeratingWithState:&v83 objects:v102 count:16];
    }
    while (v58);
  }

  os_unfair_lock_unlock(v55);
}

- (void)p_checkIfNeededAndRegisterRecentlyCreatedLocalStroke:(id)a3 drawingShapeItemUUID:(id)a4 updatedDrawingItemUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  long long v11 = +[CRLFreehandDrawingLocalShapeRegistry sharedInstance];
  unsigned int v12 = [v11 consumeLocallyDrawnShapeItemUUID:v10];

  if (v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10020E6A8;
    block[3] = &unk_1014CBE50;
    block[4] = self;
    id v14 = v9;
    id v15 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)p_fetchAllShapeItemsFromDrawingItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableArray);
  uint64_t v5 = [v3 childInfos];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v3 childInfos];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        id v14 = sub_1002469D0(v13, v12);
        if (v14) {
          [v6 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)p_fetchAllDrawingItemsFromCanvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v3 = [WeakRetained board];
  id v4 = [v3 rootContainer];
  uint64_t v5 = +[CRLPKDrawingProvider allDrawingItemsDescendedFromContainer:v4];
  id v6 = +[NSSet setWithArray:v5];

  return v6;
}

+ (void)p_recursivelyAddFreehandDrawingItemsFromGroup:(id)a3 drawingItems:(id)a4
{
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [a3 childItems];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        id v14 = sub_1002469D0(v13, v12);
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = sub_1002469D0(v15, v12);
        long long v17 = (void *)v16;
        if (v14)
        {
          [v6 addObject:v14];
        }
        else if (v16)
        {
          [a1 p_recursivelyAddFreehandDrawingItemsFromGroup:v16 drawingItems:v6];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)p_addSubscriptionsForDrawingItemChanges
{
  [(CRLPKDrawingProvider *)self p_fetchAllDrawingItemsFromCanvas];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = [v7 childItems];
        id v9 = +[NSMutableSet setWithArray:v8];
        drawingParentIdsToShapeItemsBeingListenedTo = self->_drawingParentIdsToShapeItemsBeingListenedTo;
        long long v11 = [v7 id];
        [(NSMutableDictionary *)drawingParentIdsToShapeItemsBeingListenedTo setObject:v9 forKeyedSubscript:v11];

        LODWORD(drawingParentIdsToShapeItemsBeingListenedTo) = [v7 locked];
        uuidsForUnlockedDrawingItems = self->_uuidsForUnlockedDrawingItems;
        uint64_t v13 = [v7 id];
        if (drawingParentIdsToShapeItemsBeingListenedTo) {
          [(NSMutableSet *)uuidsForUnlockedDrawingItems removeObject:v13];
        }
        else {
          [(NSMutableSet *)uuidsForUnlockedDrawingItems addObject:v13];
        }

        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        [(NSMutableSet *)self->_drawingItemsNeedingUpdatedPKStrokes addObject:v7];
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
      }
      id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (id)p_createUUIDFromHashingStrokeTransformForShapeItem:(id)a3
{
  id v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (v3) {
    [v3 transformInRoot];
  }
  *(_OWORD *)md = v9;
  long long v14 = v10;
  long long v15 = v11;
  double data = sub_10007F808((double *)md);
  *(_OWORD *)md = v9;
  long long v14 = v10;
  long long v15 = v11;
  double v7 = sub_10007F7C8((double *)md);
  CC_SHA256_Update(&c, &v11, 8u);
  CC_SHA256_Update(&c, (char *)&v11 + 8, 8u);
  CC_SHA256_Update(&c, &data, 8u);
  CC_SHA256_Update(&c, &v7, 8u);
  CC_SHA256_Final(md, &c);
  md[6] = md[6] & 0xF | 0x50;
  md[8] = md[8] & 0x3F | 0x80;
  id v4 = objc_alloc((Class)NSUUID);
  id v5 = [v4 initWithUUIDBytes:md, *(void *)&v7, *(void *)&data];

  return v5;
}

- (BOOL)isTornDown
{
  return self->_isTornDown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsToStrokes, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsToDrawingShapeItems, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsToDrawingItems, 0);
  objc_storeStrong((id *)&self->_updatedParentUUIDToDrawingShapeItemUUIDsDict, 0);
  objc_storeStrong((id *)&self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict, 0);
  objc_storeStrong((id *)&self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict, 0);
  objc_storeStrong((id *)&self->_observersWantingConsolidatedPKDrawing, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_drawingItemsNeedingRemovedPKStrokes, 0);
  objc_storeStrong((id *)&self->_drawingItemsNeedingUpdatedPKStrokes, 0);
  objc_storeStrong((id *)&self->_changedPKStrokesForDrawingItemIds, 0);
  objc_storeStrong((id *)&self->_cachedPKStrokesForDrawingItemsOrderedKeys, 0);
  objc_storeStrong((id *)&self->_cachedPKStrokesForDrawingItems, 0);
  objc_storeStrong((id *)&self->_shapeItemIdToParentItemId, 0);
  objc_storeStrong((id *)&self->_uuidsForUnlockedDrawingItems, 0);
  objc_storeStrong((id *)&self->_drawingParentIdsToShapeItemsBeingListenedTo, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end