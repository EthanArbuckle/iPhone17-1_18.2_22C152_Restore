@interface PXStoryResourcesPreloadingCoordinator
- (OS_dispatch_queue)storyQueue;
- (PXStoryResourcesPreloadingCoordinator)init;
- (PXStoryResourcesPreloadingCoordinator)initWithQueue:(id)a3;
- (PXUpdater)updater;
- (id)_infoForPreloadingController:(id)a3 createIfNeeded:(BOOL)a4;
- (void)_invalidateInfosOrder;
- (void)_invalidatePreloadingControllers;
- (void)_setNeedsUpdate;
- (void)_updateInfosOrder;
- (void)_updatePreloadingControllers;
- (void)addPreloadingController:(id)a3 withPriority:(int64_t)a4;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)removePreloadingController:(id)a3;
@end

@implementation PXStoryResourcesPreloadingCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_infos, 0);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PreloadinControllerObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryResourcesPreloadingCoordinator.m" lineNumber:146 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if (([v9 isCompletedChangeDescriptor] & ~a4) == 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__PXStoryResourcesPreloadingCoordinator_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DBAAC8;
    v12[4] = self;
    [(PXStoryResourcesPreloadingCoordinator *)self performChanges:v12];
  }
}

uint64_t __70__PXStoryResourcesPreloadingCoordinator_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePreloadingControllers];
}

- (void)_updatePreloadingControllers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = self->_infos;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v9 = [v8 preloadingController];
        char v10 = [v9 isCompleted];

        if ((v10 & 1) == 0)
        {
          uint64_t v11 = [v8 priority];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v12 = self->_infos;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        BOOL v18 = objc_msgSend(v17, "priority", (void)v20) <= v11;
        v19 = [v17 preloadingController];
        [v19 setIsPreloadingEnabled:v18];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }
}

- (void)_invalidatePreloadingControllers
{
  id v2 = [(PXStoryResourcesPreloadingCoordinator *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePreloadingControllers];
}

- (void)_updateInfosOrder
{
}

uint64_t __58__PXStoryResourcesPreloadingCoordinator__updateInfosOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "priority"));
  v7 = NSNumber;
  uint64_t v8 = [v5 priority];

  id v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)_invalidateInfosOrder
{
  id v2 = [(PXStoryResourcesPreloadingCoordinator *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInfosOrder];
}

- (void)_setNeedsUpdate
{
}

- (void)removePreloadingController:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[PXStoryResourcesPreloadingCoordinator _infoForPreloadingController:createIfNeeded:](self, "_infoForPreloadingController:createIfNeeded:");
  if (v4)
  {
    [v5 setIsPreloadingEnabled:0];
    [v5 unregisterChangeObserver:self context:PreloadinControllerObservationContext];
    [(NSMutableArray *)self->_infos removeObject:v4];
    [(PXStoryResourcesPreloadingCoordinator *)self _invalidatePreloadingControllers];
  }
}

- (void)addPreloadingController:(id)a3 withPriority:(int64_t)a4
{
  uint64_t v6 = [(PXStoryResourcesPreloadingCoordinator *)self _infoForPreloadingController:a3 createIfNeeded:1];
  [v6 setPriority:a4];

  [(PXStoryResourcesPreloadingCoordinator *)self _invalidateInfosOrder];
  [(PXStoryResourcesPreloadingCoordinator *)self _invalidatePreloadingControllers];
}

- (id)_infoForPreloadingController:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = self->_infos;
  uint64_t v8 = (_PXStoryPreloadingControllerInfo *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (_PXStoryPreloadingControllerInfo *)((char *)i + 1))
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "preloadingController", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          uint64_t v8 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = (_PXStoryPreloadingControllerInfo *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!v8 && v4)
  {
    uint64_t v8 = objc_alloc_init(_PXStoryPreloadingControllerInfo);
    [(_PXStoryPreloadingControllerInfo *)v8 setPreloadingController:v6];
    [v6 registerChangeObserver:self context:PreloadinControllerObservationContext];
    [(NSMutableArray *)self->_infos addObject:v8];
  }

  return v8;
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloadingCoordinator;
  [(PXStoryResourcesPreloadingCoordinator *)&v4 didPerformChanges];
  v3 = [(PXStoryResourcesPreloadingCoordinator *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryResourcesPreloadingCoordinator *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesPreloadingCoordinator;
  [(PXStoryResourcesPreloadingCoordinator *)&v6 performChanges:v4];
}

- (PXStoryResourcesPreloadingCoordinator)initWithQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryResourcesPreloadingCoordinator;
  id v5 = [(PXStoryResourcesPreloadingCoordinator *)&v15 init];
  if (v5)
  {
    if (v4)
    {
      objc_super v6 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v6;
    }
    else
    {
      uint64_t v8 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v8;
    }

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    infos = v5->_infos;
    v5->_infos = v10;

    uint64_t v12 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v5 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v12;

    [(PXUpdater *)v5->_updater addUpdateSelector:sel__updateInfosOrder];
    [(PXUpdater *)v5->_updater addUpdateSelector:sel__updatePreloadingControllers];
  }

  return v5;
}

- (PXStoryResourcesPreloadingCoordinator)init
{
  return [(PXStoryResourcesPreloadingCoordinator *)self initWithQueue:0];
}

@end