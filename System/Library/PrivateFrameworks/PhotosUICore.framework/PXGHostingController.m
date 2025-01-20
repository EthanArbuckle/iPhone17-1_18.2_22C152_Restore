@interface PXGHostingController
+ (OS_dispatch_queue)sharedQueue;
- (BOOL)clientQueue_isPerformingChanges;
- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5;
- (BOOL)layoutQueue_acceptSize:(id)a3;
- (BOOL)layoutQueue_isAppInactive;
- (BOOL)layoutQueue_pendingProposedSizeWasDelayed;
- (NSArray)presenters;
- (NSHashTable)clientQueue_activePresenters;
- (NSHashTable)lock_observers;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)layoutQueue;
- (PXApplicationState)mainQueue_applicationState;
- (PXGAsyncScrollController)layoutQueue_scrollController;
- (PXGConcreteEngineControllerConfiguration)clientQueue_configuration;
- (PXGConcreteEngineControllerConfiguration)layoutQueue_configuration;
- (PXGEngine)layoutQueue_engine;
- (PXGHostingController)init;
- (PXGHostingController)initWithClientQueue:(id)a3 layoutQueue:(id)a4;
- (PXGHostingController)initWithClientQueue:(id)a3 layoutQueue:(id)a4 initialConfiguration:(id)a5;
- (PXGHostingControllerProposedSize)layoutQueue_pendingProposedSize;
- (PXGLayout)layoutQueue_placeholderLayout;
- (PXGPixelBufferMetalRenderDestination)layoutQueue_renderDestination;
- (PXGRenderFrame)lastFrame;
- (PXGRenderFrame)lock_lastFrame;
- (id)addPresenter;
- (id)layoutQueue_pendingRootLayoutPromise;
- (id)onPresentersDidChange;
- (int64_t)layoutQueue_skipDegradedFramesCount;
- (int64_t)layoutQueue_skipFramesCount;
- (os_unfair_lock_s)lock;
- (void)_clientQueue_propagateConfigurationToEngine;
- (void)_dispatchFrame:(id)a3 async:(BOOL)a4 toObserver:(id)a5;
- (void)_distributeFrame:(id)a3;
- (void)_layoutQueue_applyConfiguration;
- (void)_layoutQueue_performInitialEngineSetupIfNeeded;
- (void)_mainQueue_initialize;
- (void)_mainQueue_updateIsAppInactive;
- (void)_notePresentersDidChange;
- (void)clientQueue_presenterDidChange:(id)a3;
- (void)dealloc;
- (void)engineSetNeedsUpdate:(id)a3;
- (void)layoutQueue_applySize:(CGSize)a3;
- (void)layoutQueue_skipFrameCount:(int64_t)a3 forProposedSize:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)registerFrameObserver:(id)a3;
- (void)setLayoutQueue_configuration:(id)a3;
- (void)setLayoutQueue_isAppInactive:(BOOL)a3;
- (void)setLayoutQueue_pendingProposedSize:(id)a3;
- (void)setLayoutQueue_pendingProposedSizeWasDelayed:(BOOL)a3;
- (void)setLayoutQueue_pendingRootLayoutPromise:(id)a3;
- (void)setLayoutQueue_skipDegradedFramesCount:(int64_t)a3;
- (void)setLayoutQueue_skipFramesCount:(int64_t)a3;
- (void)setOnPresentersDidChange:(id)a3;
- (void)unregisterFrameObserver:(id)a3;
@end

@implementation PXGHostingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainQueue_applicationState, 0);
  objc_storeStrong((id *)&self->_lock_lastFrame, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_layoutQueue_pendingProposedSize, 0);
  objc_storeStrong(&self->_layoutQueue_pendingRootLayoutPromise, 0);
  objc_storeStrong((id *)&self->_layoutQueue_placeholderLayout, 0);
  objc_storeStrong((id *)&self->_layoutQueue_renderDestination, 0);
  objc_storeStrong((id *)&self->_layoutQueue_engine, 0);
  objc_storeStrong((id *)&self->_layoutQueue_scrollController, 0);
  objc_storeStrong((id *)&self->_layoutQueue_configuration, 0);
  objc_storeStrong((id *)&self->_clientQueue_activePresenters, 0);
  objc_storeStrong((id *)&self->_clientQueue_configuration, 0);
  objc_storeStrong(&self->_onPresentersDidChange, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (PXApplicationState)mainQueue_applicationState
{
  return self->_mainQueue_applicationState;
}

- (PXGRenderFrame)lock_lastFrame
{
  return self->_lock_lastFrame;
}

- (NSHashTable)lock_observers
{
  return self->_lock_observers;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLayoutQueue_skipDegradedFramesCount:(int64_t)a3
{
  self->_layoutQueue_skipDegradedFramesCount = a3;
}

- (int64_t)layoutQueue_skipDegradedFramesCount
{
  return self->_layoutQueue_skipDegradedFramesCount;
}

- (void)setLayoutQueue_skipFramesCount:(int64_t)a3
{
  self->_layoutQueue_skipFramesCount = a3;
}

- (int64_t)layoutQueue_skipFramesCount
{
  return self->_layoutQueue_skipFramesCount;
}

- (void)setLayoutQueue_pendingProposedSizeWasDelayed:(BOOL)a3
{
  self->_layoutQueue_pendingProposedSizeWasDelayed = a3;
}

- (BOOL)layoutQueue_pendingProposedSizeWasDelayed
{
  return self->_layoutQueue_pendingProposedSizeWasDelayed;
}

- (void)setLayoutQueue_pendingProposedSize:(id)a3
{
}

- (PXGHostingControllerProposedSize)layoutQueue_pendingProposedSize
{
  return self->_layoutQueue_pendingProposedSize;
}

- (void)setLayoutQueue_pendingRootLayoutPromise:(id)a3
{
}

- (id)layoutQueue_pendingRootLayoutPromise
{
  return self->_layoutQueue_pendingRootLayoutPromise;
}

- (PXGLayout)layoutQueue_placeholderLayout
{
  return self->_layoutQueue_placeholderLayout;
}

- (PXGPixelBufferMetalRenderDestination)layoutQueue_renderDestination
{
  return self->_layoutQueue_renderDestination;
}

- (PXGEngine)layoutQueue_engine
{
  return self->_layoutQueue_engine;
}

- (PXGAsyncScrollController)layoutQueue_scrollController
{
  return self->_layoutQueue_scrollController;
}

- (BOOL)layoutQueue_isAppInactive
{
  return self->_layoutQueue_isAppInactive;
}

- (PXGConcreteEngineControllerConfiguration)layoutQueue_configuration
{
  return self->_layoutQueue_configuration;
}

- (NSHashTable)clientQueue_activePresenters
{
  return self->_clientQueue_activePresenters;
}

- (PXGConcreteEngineControllerConfiguration)clientQueue_configuration
{
  return self->_clientQueue_configuration;
}

- (BOOL)clientQueue_isPerformingChanges
{
  return self->_clientQueue_isPerformingChanges;
}

- (void)setOnPresentersDidChange:(id)a3
{
}

- (id)onPresentersDidChange
{
  return self->_onPresentersDidChange;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ApplicationStateObservationContext_287222 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXGHostingController.m" lineNumber:508 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXGHostingController *)self _mainQueue_updateIsAppInactive];
    id v9 = v11;
  }
}

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  int64_t layoutQueue_skipDegradedFramesCount = self->_layoutQueue_skipDegradedFramesCount;
  if (self->_layoutQueue_skipFramesCount <= 0)
  {
    if (layoutQueue_skipDegradedFramesCount < 1) {
      goto LABEL_9;
    }
  }
  else if (layoutQueue_skipDegradedFramesCount < 1)
  {
    goto LABEL_8;
  }
  *(void *)v18 = 0;
  v19 = v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v12 = [(PXGEngine *)self->_layoutQueue_engine entityManager];
  v13 = [v12 loadingStatus];

  id v14 = v13;
  uint64_t v15 = [v14 states];
  [v9 visibleRect];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__PXGHostingController_engine_shouldRenderLayout_sprites___block_invoke;
  v17[3] = &unk_1E5DD0F80;
  v17[4] = v18;
  v17[5] = v15;
  objc_msgSend(v10, "enumerateSpritesInRect:usingBlock:", v17);
  if (v19[24]) {
    PXGTungstenGetLog();
  }
  self->_int64_t layoutQueue_skipDegradedFramesCount = 0;

  _Block_object_dispose(v18, 8);
  if (self->_layoutQueue_skipFramesCount >= 1) {
LABEL_8:
  }
    PXGTungstenGetLog();
LABEL_9:

  return 1;
}

uint64_t __58__PXGHostingController_engine_shouldRenderLayout_sprites___block_invoke(uint64_t result, uint64_t a2, unsigned int **a3, unsigned char *a4)
{
  if (*(unsigned char *)a3[3] != 1)
  {
    unsigned int v4 = *(unsigned __int8 *)(*(void *)(result + 40) + **a3);
    BOOL v5 = v4 > 4;
    int v6 = (1 << v4) & 0x16;
    if (!v5 && v6 != 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (void)engineSetNeedsUpdate:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  layoutQueue_scrollController = self->_layoutQueue_scrollController;
  [(PXGAsyncScrollController *)layoutQueue_scrollController setNeedsUpdate];
}

- (void)layoutQueue_applySize:(CGSize)a3
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  PXSizeIsEmpty();
}

- (BOOL)layoutQueue_acceptSize:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = (PXGHostingControllerProposedSize *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  layoutQueue_pendingProposedSize = self->_layoutQueue_pendingProposedSize;
  if (layoutQueue_pendingProposedSize == v4)
  {
    self->_layoutQueue_pendingProposedSize = 0;

    PXGTungstenGetLog();
  }

  return layoutQueue_pendingProposedSize == v4;
}

- (void)layoutQueue_skipFrameCount:(int64_t)a3 forProposedSize:(id)a4
{
  layoutQueue = self->_layoutQueue;
  int v6 = (PXGHostingControllerProposedSize *)a4;
  dispatch_assert_queue_V2(layoutQueue);
  layoutQueue_pendingProposedSize = self->_layoutQueue_pendingProposedSize;

  if (layoutQueue_pendingProposedSize == v6) {
    ++self->_layoutQueue_skipFramesCount;
  }
}

- (void)_layoutQueue_performInitialEngineSetupIfNeeded
{
  if (!self->_layoutQueue_engine)
  {
    v2 = self->_layoutQueue_configuration;
    [(PXGConcreteEngineControllerConfiguration *)v2 referenceSize];
    [(PXGConcreteEngineControllerConfiguration *)v2 displayScale];
    PXSizeScale();
  }
}

void __70__PXGHostingController__layoutQueue_performInitialEngineSetupIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v5 = [[PXGRenderFrame alloc] initWithFrameID:a3 pixelBuffer:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _distributeFrame:v5];
}

- (void)_layoutQueue_applyConfiguration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  [(PXGHostingController *)self _layoutQueue_performInitialEngineSetupIfNeeded];
  uint64_t v3 = self->_layoutQueue_configuration;
  unsigned int v4 = self->_layoutQueue_engine;
  if (v4)
  {
    layoutQueue_pendingRootLayoutPromise = (void (**)(void))self->_layoutQueue_pendingRootLayoutPromise;
    if (layoutQueue_pendingRootLayoutPromise)
    {
      layoutQueue_pendingRootLayoutPromise[2]();
      int v6 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
      layoutQueue_placeholderLayout = v6;
      if (!v6) {
        layoutQueue_placeholderLayout = self->_layoutQueue_placeholderLayout;
      }
      [(PXGEngine *)v4 setLayout:layoutQueue_placeholderLayout];

      id v8 = self->_layoutQueue_pendingRootLayoutPromise;
      self->_layoutQueue_pendingRootLayoutPromise = 0;

      id v9 = [(PXGEngine *)v4 layout];
      [(PXGConcreteEngineControllerConfiguration *)v3 referenceSize];
      objc_msgSend(v9, "hostingControllerDidChangeReferenceSize:");
    }
    id v10 = [(PXGConcreteEngineControllerConfiguration *)v3 viewEnvironment];
    [(PXGEngine *)v4 setViewEnvironment:v10];

    [(PXGEngine *)v4 setVisible:[(PXGConcreteEngineControllerConfiguration *)v3 isVisible]];
    id v11 = [(PXGConcreteEngineControllerConfiguration *)v3 backgroundColor];
    [(PXGPixelBufferMetalRenderDestination *)self->_layoutQueue_renderDestination setBackgroundColor:v11];

    [(PXGConcreteEngineControllerConfiguration *)v3 displayScale];
    if (v12 == 0.0) {
      double v12 = 1.0;
    }
    [(PXGPixelBufferMetalRenderDestination *)self->_layoutQueue_renderDestination setScale:v12];
    v13 = [(PXGEngine *)v4 layout];
    [(PXGConcreteEngineControllerConfiguration *)v3 displayScale];
    objc_msgSend(v13, "setDisplayScale:");
    id v14 = self->_layoutQueue_scrollController;
    [(PXGAsyncScrollController *)v14 referenceSize];
    double v16 = v15;
    double v18 = v17;
    [(PXGConcreteEngineControllerConfiguration *)v3 referenceSize];
    BOOL v21 = v18 == v20 && v16 == v19;
    if (!v21
      || ([(PXGPixelBufferMetalRenderDestination *)self->_layoutQueue_renderDestination renderSize],
          double v23 = v22,
          double v25 = v24,
          [(PXGConcreteEngineControllerConfiguration *)v3 pixelSize],
          v23 != v27)
      || v25 != v26)
    {
      v28 = [PXGHostingControllerProposedSize alloc];
      [(PXGConcreteEngineControllerConfiguration *)v3 referenceSize];
      v31 = -[PXGHostingControllerProposedSize initWithReferenceSize:shouldPreferAcceptingReferenceSize:hostingController:](v28, "initWithReferenceSize:shouldPreferAcceptingReferenceSize:hostingController:", [(PXGConcreteEngineControllerConfiguration *)v3 deferReferenceSizeChanges] ^ 1, self, v29, v30);
      layoutQueue_pendingProposedSize = self->_layoutQueue_pendingProposedSize;
      self->_layoutQueue_pendingProposedSize = v31;

      PXGTungstenGetLog();
    }
    [v13 hostingControllerCanceledPreviouslyProposedReferenceSize];
    uint64_t v33 = ![(PXGHostingController *)self layoutQueue_isAppInactive]
       && [(PXGConcreteEngineControllerConfiguration *)v3 isVisible];
    [(PXGAsyncScrollController *)v14 setIsActive:v33];
  }
}

- (void)setLayoutQueue_isAppInactive:(BOOL)a3
{
  if (self->_layoutQueue_isAppInactive != a3)
  {
    self->_layoutQueue_isAppInactive = a3;
    [(PXGHostingController *)self _layoutQueue_applyConfiguration];
  }
}

- (void)setLayoutQueue_configuration:(id)a3
{
  id v9 = a3;
  int64_t v5 = [(PXGConcreteEngineControllerConfiguration *)self->_layoutQueue_configuration version];
  if (v5 != [v9 version])
  {
    int v6 = [v9 rootLayoutPromise];

    if (v6)
    {
      uint64_t v7 = [v9 rootLayoutPromise];
      id layoutQueue_pendingRootLayoutPromise = self->_layoutQueue_pendingRootLayoutPromise;
      self->_id layoutQueue_pendingRootLayoutPromise = v7;

      [v9 setRootLayoutPromise:0];
    }
    objc_storeStrong((id *)&self->_layoutQueue_configuration, a3);
    [(PXGHostingController *)self _layoutQueue_applyConfiguration];
  }
}

- (void)_clientQueue_propagateConfigurationToEngine
{
  uint64_t v3 = (void *)[(PXGConcreteEngineControllerConfiguration *)self->_clientQueue_configuration copy];
  unsigned int v4 = [(PXGConcreteEngineControllerConfiguration *)self->_clientQueue_configuration rootLayoutPromise];

  if (v4) {
    [(PXGConcreteEngineControllerConfiguration *)self->_clientQueue_configuration setRootLayoutPromise:0];
  }
  objc_initWeak(&location, self);
  layoutQueue = self->_layoutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXGHostingController__clientQueue_propagateConfigurationToEngine__block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v9, &location);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(layoutQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__PXGHostingController__clientQueue_propagateConfigurationToEngine__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLayoutQueue_configuration:", v1);
}

- (void)_dispatchFrame:(id)a3 async:(BOOL)a4 toObserver:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXGHostingController__dispatchFrame_async_toObserver___block_invoke;
    aBlock[3] = &unk_1E5DD0F30;
    id v11 = v9;
    id v16 = v11;
    double v17 = self;
    id v18 = v8;
    double v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v6)
    {
      id v14 = [v11 hostingControllerObservationQueue];
      dispatch_async(v14, v13);
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
}

uint64_t __56__PXGHostingController__dispatchFrame_async_toObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hostingController:*(void *)(a1 + 40) didRenderFrame:*(void *)(a1 + 48)];
}

- (void)_distributeFrame:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_lastFrame, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v6 = self->_lock_observers;
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
        -[PXGHostingController _dispatchFrame:async:toObserver:](self, "_dispatchFrame:async:toObserver:", v5, 1, *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterFrameObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)registerFrameObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers addObject:v7];
  unsigned int v4 = self->_lock_lastFrame;
  os_unfair_lock_unlock(&self->_lock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = [v7 hostingControllerObservationQueue];
    BOOL v6 = v5 != (void *)MEMORY[0x1E4F14428];
  }
  else
  {
    BOOL v6 = 1;
  }
  [(PXGHostingController *)self _dispatchFrame:v4 async:v6 toObserver:v7];
}

- (PXGRenderFrame)lastFrame
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v4 = self->_lock_lastFrame;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)performChanges:(id)a3
{
  clientQueue = self->_clientQueue;
  id v5 = (void (**)(id, PXGConcreteEngineControllerConfiguration *))a3;
  dispatch_assert_queue_V2(clientQueue);
  BOOL clientQueue_isPerformingChanges = self->_clientQueue_isPerformingChanges;
  self->_BOOL clientQueue_isPerformingChanges = 1;
  int64_t v7 = [(PXGConcreteEngineControllerConfiguration *)self->_clientQueue_configuration version];
  v5[2](v5, self->_clientQueue_configuration);

  int64_t v8 = [(PXGConcreteEngineControllerConfiguration *)self->_clientQueue_configuration version];
  self->_BOOL clientQueue_isPerformingChanges = clientQueue_isPerformingChanges;
  if (!clientQueue_isPerformingChanges && v7 != v8)
  {
    [(PXGHostingController *)self _clientQueue_propagateConfigurationToEngine];
  }
}

- (void)_notePresentersDidChange
{
  v2 = [(PXGHostingController *)self onPresentersDidChange];
  if (v2)
  {
    uint64_t v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (void)clientQueue_presenterDidChange:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(PXGHostingController *)self _notePresentersDidChange];
}

- (NSArray)presenters
{
}

id __34__PXGHostingController_presenters__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];
  return v2;
}

- (id)addPresenter
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  uint64_t v3 = objc_alloc_init(PXGConcreteHostingControllerPresenter);
  [(NSHashTable *)self->_clientQueue_activePresenters addObject:v3];
  [(PXGConcreteHostingControllerPresenter *)v3 setHostingController:self];
  [(PXGHostingController *)self _notePresentersDidChange];
  return v3;
}

- (void)dealloc
{
  uint64_t v3 = self->_layoutQueue_engine;
  unsigned int v4 = self->_layoutQueue;
  id v5 = v4;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PXGHostingController_dealloc__block_invoke;
    block[3] = &unk_1E5DD32A8;
    int64_t v8 = v4;
    uint64_t v9 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PXGHostingController;
  [(PXGHostingController *)&v6 dealloc];
}

void __31__PXGHostingController_dealloc__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PXGHostingController_dealloc__block_invoke_2;
  block[3] = &unk_1E5DD36F8;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __31__PXGHostingController_dealloc__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) keepAlive];
}

- (void)_mainQueue_updateIsAppInactive
{
  id v3 = [(PXGHostingController *)self mainQueue_applicationState];
  BOOL v4 = [v3 visibilityState] != 1;

  objc_initWeak(&location, self);
  layoutQueue = self->_layoutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PXGHostingController__mainQueue_updateIsAppInactive__block_invoke;
  block[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v7, &location);
  BOOL v8 = v4;
  dispatch_async(layoutQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __54__PXGHostingController__mainQueue_updateIsAppInactive__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLayoutQueue_isAppInactive:", v1);
}

- (void)_mainQueue_initialize
{
  id v3 = +[PXApplicationState sharedState];
  mainQueue_applicationState = self->_mainQueue_applicationState;
  self->_mainQueue_applicationState = v3;

  [(PXApplicationState *)self->_mainQueue_applicationState registerChangeObserver:self context:ApplicationStateObservationContext_287222];
  [(PXGHostingController *)self _mainQueue_updateIsAppInactive];
}

- (PXGHostingController)init
{
  id v3 = +[PXGHostingController sharedQueue];
  BOOL v4 = [(PXGHostingController *)self initWithClientQueue:MEMORY[0x1E4F14428] layoutQueue:v3];

  return v4;
}

- (PXGHostingController)initWithClientQueue:(id)a3 layoutQueue:(id)a4 initialConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PXGHostingController;
  long long v12 = [(PXGHostingController *)&v26 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientQueue, a3);
    objc_storeStrong((id *)&v13->_layoutQueue, a4);
    long long v14 = objc_alloc_init(PXGConcreteEngineControllerConfiguration);
    clientQueue_configuration = v13->_clientQueue_configuration;
    v13->_clientQueue_configuration = v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    clientQueue_activePresenters = v13->_clientQueue_activePresenters;
    v13->_clientQueue_activePresenters = (NSHashTable *)v16;

    uint64_t v18 = [(PXGConcreteEngineControllerConfiguration *)v13->_clientQueue_configuration copy];
    layoutQueue_configuration = v13->_layoutQueue_configuration;
    v13->_layoutQueue_configuration = (PXGConcreteEngineControllerConfiguration *)v18;

    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v13->_lock_observers;
    v13->_lock_observers = (NSHashTable *)v20;

    [(PXGHostingController *)v13 performChanges:v11];
    objc_initWeak(&location, v13);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__PXGHostingController_initWithClientQueue_layoutQueue_initialConfiguration___block_invoke;
    v23[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v24, &location);
    dispatch_async(MEMORY[0x1E4F14428], v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __77__PXGHostingController_initWithClientQueue_layoutQueue_initialConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_initialize");
}

- (PXGHostingController)initWithClientQueue:(id)a3 layoutQueue:(id)a4
{
  return [(PXGHostingController *)self initWithClientQueue:a3 layoutQueue:a4 initialConfiguration:&__block_literal_global_4_287343];
}

+ (OS_dispatch_queue)sharedQueue
{
  if (sharedQueue_onceToken_287351 != -1) {
    dispatch_once(&sharedQueue_onceToken_287351, &__block_literal_global_287352);
  }
  v2 = (void *)sharedQueue_sharedQueue_287353;
  return (OS_dispatch_queue *)v2;
}

void __35__PXGHostingController_sharedQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.hostingController.async-queue", attr);
  v2 = (void *)sharedQueue_sharedQueue_287353;
  sharedQueue_sharedQueue_287353 = (uint64_t)v1;
}

@end