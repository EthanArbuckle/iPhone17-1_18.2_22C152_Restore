@interface PUParallaxLayerStackViewModelUpdater
- (BOOL)waitForInFlightRenders:(double)a3;
- (NUCoalescer)styleChangeCoalescer;
- (OS_dispatch_group)transactionGroup;
- (OS_dispatch_queue)transactionResponseQueue;
- (PIParallaxClockLayoutRequest)clockOverlapRequest;
- (PIParallaxClockMaterialRequest)clockMaterialRequest;
- (PIParallaxLayerStackRequest)backfillRenderRequest;
- (PIParallaxLayerStackRequest)mainRenderRequest;
- (PIParallaxLayerStackRequest)settlingEffectRenderRequest;
- (PISegmentationItem)item;
- (PUParallaxLayerStackViewModelUpdater)init;
- (PUParallaxLayerStackViewModelUpdater)initWithSegmentationItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_updatePriorityForRequest:(id)a3 viewModel:(id)a4 highPriority:(BOOL)a5 importanceOrder:(double)a6;
- (void)beginRenderTransaction;
- (void)cancelPendingRenders;
- (void)endRenderTransaction;
- (void)ensureOffscreenModelIsUnloaded:(id)a3;
- (void)ensureOnscreenModelIsLoaded:(id)a3;
- (void)notifyWhenInFlightRendersComplete:(id)a3;
- (void)recalculateClockAreaLuminance:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5;
- (void)recalculateClockIntersection:(id)a3 allViewModels:(id)a4 highPriority:(BOOL)a5;
- (void)recalculateClockOverlap:(id)a3 allViewModels:(id)a4 highPriority:(BOOL)a5;
- (void)recalculateClockOverlap:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 allViewModels:(id)a6 intersectionOnly:(BOOL)a7 completion:(id)a8;
- (void)renderBackfillLayers:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 completion:(id)a6;
- (void)renderMainLayers:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 completion:(id)a6;
- (void)renderModelAfterStyleInitialization:(id)a3 isOnscreen:(BOOL)a4;
- (void)renderOffscreenModelAfterVisibleFrameChange:(id)a3 highPriority:(BOOL)a4;
- (void)renderOnscreenModelAfterStyleChange:(id)a3;
- (void)renderOnscreenModelAfterVisibleFrameChange:(id)a3 allViewModels:(id)a4;
- (void)renderSettlingEffectLayerIfNeededForViewModel:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5;
- (void)setBackfillRenderRequest:(id)a3;
- (void)setClockMaterialRequest:(id)a3;
- (void)setClockOverlapRequest:(id)a3;
- (void)setMainRenderRequest:(id)a3;
- (void)setSettlingEffectRenderRequest:(id)a3;
- (void)setStyleChangeCoalescer:(id)a3;
- (void)setTransactionGroup:(id)a3;
- (void)setTransactionResponseQueue:(id)a3;
@end

@implementation PUParallaxLayerStackViewModelUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleChangeCoalescer, 0);
  objc_storeStrong((id *)&self->_clockMaterialRequest, 0);
  objc_storeStrong((id *)&self->_clockOverlapRequest, 0);
  objc_storeStrong((id *)&self->_settlingEffectRenderRequest, 0);
  objc_storeStrong((id *)&self->_backfillRenderRequest, 0);
  objc_storeStrong((id *)&self->_mainRenderRequest, 0);
  objc_storeStrong((id *)&self->_transactionResponseQueue, 0);
  objc_storeStrong((id *)&self->_transactionGroup, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)setStyleChangeCoalescer:(id)a3
{
}

- (NUCoalescer)styleChangeCoalescer
{
  return self->_styleChangeCoalescer;
}

- (void)setClockMaterialRequest:(id)a3
{
}

- (PIParallaxClockMaterialRequest)clockMaterialRequest
{
  return self->_clockMaterialRequest;
}

- (void)setClockOverlapRequest:(id)a3
{
}

- (PIParallaxClockLayoutRequest)clockOverlapRequest
{
  return self->_clockOverlapRequest;
}

- (void)setSettlingEffectRenderRequest:(id)a3
{
}

- (PIParallaxLayerStackRequest)settlingEffectRenderRequest
{
  return self->_settlingEffectRenderRequest;
}

- (void)setBackfillRenderRequest:(id)a3
{
}

- (PIParallaxLayerStackRequest)backfillRenderRequest
{
  return self->_backfillRenderRequest;
}

- (void)setMainRenderRequest:(id)a3
{
}

- (PIParallaxLayerStackRequest)mainRenderRequest
{
  return self->_mainRenderRequest;
}

- (void)setTransactionResponseQueue:(id)a3
{
}

- (OS_dispatch_queue)transactionResponseQueue
{
  return self->_transactionResponseQueue;
}

- (void)setTransactionGroup:(id)a3
{
}

- (OS_dispatch_group)transactionGroup
{
  return self->_transactionGroup;
}

- (PISegmentationItem)item
{
  return self->_item;
}

- (void)ensureOffscreenModelIsUnloaded:(id)a3
{
  id v3 = a3;
  if (([v3 mainLayersArePruned] & 1) == 0) {
    [v3 performChanges:&__block_literal_global_46_101276];
  }
}

uint64_t __71__PUParallaxLayerStackViewModelUpdater_ensureOffscreenModelIsUnloaded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pruneMainLayers];
}

- (void)ensureOnscreenModelIsLoaded:(id)a3
{
  id v4 = a3;
  if ([v4 mainLayersArePruned])
  {
    [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
    [(PUParallaxLayerStackViewModelUpdater *)self renderMainLayers:v4 highPriority:1 importanceOrder:0 completion:0.0];
    [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
  }
}

- (void)recalculateClockIntersection:(id)a3 allViewModels:(id)a4 highPriority:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  [(PUParallaxLayerStackViewModelUpdater *)self recalculateClockOverlap:v9 highPriority:v5 importanceOrder:v8 allViewModels:1 intersectionOnly:0 completion:0.0];

  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

- (void)recalculateClockOverlap:(id)a3 allViewModels:(id)a4 highPriority:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  [(PUParallaxLayerStackViewModelUpdater *)self recalculateClockOverlap:v9 highPriority:v5 importanceOrder:v8 allViewModels:0 intersectionOnly:0 completion:0.0];

  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

- (void)renderOffscreenModelAfterVisibleFrameChange:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  if (([v6 mainLayersArePruned] & 1) == 0) {
    [v6 performChanges:&__block_literal_global_101278];
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __97__PUParallaxLayerStackViewModelUpdater_renderOffscreenModelAfterVisibleFrameChange_highPriority___block_invoke_2;
  v11 = &unk_1E5F2ECC8;
  v12 = self;
  id v13 = v6;
  id v7 = v6;
  [(PUParallaxLayerStackViewModelUpdater *)self renderBackfillLayers:v7 highPriority:v4 importanceOrder:&v8 completion:0.0];
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

uint64_t __97__PUParallaxLayerStackViewModelUpdater_renderOffscreenModelAfterVisibleFrameChange_highPriority___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recalculateClockAreaLuminance:*(void *)(a1 + 40) highPriority:1 importanceOrder:0.5];
}

uint64_t __97__PUParallaxLayerStackViewModelUpdater_renderOffscreenModelAfterVisibleFrameChange_highPriority___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pruneMainLayers];
}

- (void)renderOnscreenModelAfterVisibleFrameChange:(id)a3 allViewModels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  [(PUParallaxLayerStackViewModelUpdater *)self renderMainLayers:v6 highPriority:1 importanceOrder:0 completion:0.0];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __97__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterVisibleFrameChange_allViewModels___block_invoke;
  v12 = &unk_1E5F2ECC8;
  id v13 = self;
  id v14 = v6;
  id v8 = v6;
  [(PUParallaxLayerStackViewModelUpdater *)self recalculateClockOverlap:v8 highPriority:1 importanceOrder:v7 allViewModels:0 intersectionOnly:&v9 completion:0.1];

  -[PUParallaxLayerStackViewModelUpdater renderBackfillLayers:highPriority:importanceOrder:completion:](self, "renderBackfillLayers:highPriority:importanceOrder:completion:", v8, 1, 0, 1.0, v9, v10, v11, v12, v13);
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

uint64_t __97__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterVisibleFrameChange_allViewModels___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recalculateClockAreaLuminance:*(void *)(a1 + 40) highPriority:1 importanceOrder:0.75];
}

- (void)renderOnscreenModelAfterStyleChange:(id)a3
{
  id v4 = a3;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke;
  uint64_t v9 = &unk_1E5F2ECC8;
  uint64_t v10 = self;
  id v11 = v4;
  id v5 = v4;
  [(PUParallaxLayerStackViewModelUpdater *)self renderMainLayers:v5 highPriority:1 importanceOrder:&v6 completion:0.25];
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

void __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) styleChangeCoalescer];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke_2;
  v3[3] = &unk_1E5F2E4E8;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 coalesceBlock:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained recalculateClockAreaLuminance:*(void *)(a1 + 32) highPriority:1 importanceOrder:0.5];
  [WeakRetained renderBackfillLayers:*(void *)(a1 + 32) highPriority:1 importanceOrder:0 completion:1.0];
}

- (void)renderModelAfterStyleInitialization:(id)a3 isOnscreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  if (v4)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke;
    v19[3] = &unk_1E5F2ECC8;
    uint64_t v7 = &v20;
    v19[4] = self;
    id v20 = v6;
    id v8 = v6;
    [(PUParallaxLayerStackViewModelUpdater *)self renderMainLayers:v8 highPriority:1 importanceOrder:v19 completion:0.0];
    double v9 = 1.0;
    uint64_t v10 = self;
    id v11 = v8;
    v12 = 0;
  }
  else
  {
    [(PUParallaxLayerStackViewModelUpdater *)self ensureOffscreenModelIsUnloaded:v6];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke_2;
    v16 = &unk_1E5F2ECC8;
    uint64_t v7 = &v18;
    v17 = self;
    id v18 = v6;
    id v11 = v6;
    double v9 = 0.0;
    v12 = &v13;
    uint64_t v10 = self;
  }
  -[PUParallaxLayerStackViewModelUpdater renderBackfillLayers:highPriority:importanceOrder:completion:](v10, "renderBackfillLayers:highPriority:importanceOrder:completion:", v11, 1, v12, v9, v13, v14, v15, v16, v17);

  [(PUParallaxLayerStackViewModelUpdater *)self renderSettlingEffectLayerIfNeededForViewModel:v6 highPriority:1 importanceOrder:0.5];
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

uint64_t __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recalculateClockAreaLuminance:*(void *)(a1 + 40) highPriority:1 importanceOrder:0.0];
}

uint64_t __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recalculateClockAreaLuminance:*(void *)(a1 + 40) highPriority:1 importanceOrder:0.0];
}

- (void)notifyWhenInFlightRendersComplete:(id)a3
{
}

- (BOOL)waitForInFlightRenders:(double)a3
{
  transactionGroup = self->_transactionGroup;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_group_wait(transactionGroup, v4) == 0;
}

- (void)cancelPendingRenders
{
  id v3 = [(PIParallaxLayerStackRequest *)self->_mainRenderRequest renderContext];
  [v3 cancelAllRequests];

  dispatch_time_t v4 = [(PIParallaxLayerStackRequest *)self->_backfillRenderRequest renderContext];
  [v4 cancelAllRequests];

  id v5 = [(PIParallaxLayerStackRequest *)self->_settlingEffectRenderRequest renderContext];
  [v5 cancelAllRequests];

  id v6 = [(PIParallaxClockLayoutRequest *)self->_clockOverlapRequest renderContext];
  [v6 cancelAllRequests];

  id v7 = [(PIParallaxClockMaterialRequest *)self->_clockMaterialRequest renderContext];
  [v7 cancelAllRequests];
}

- (void)endRenderTransaction
{
  transactionResponseQueue = self->_transactionResponseQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PUParallaxLayerStackViewModelUpdater_endRenderTransaction__block_invoke;
  v3[3] = &unk_1E5F2ED10;
  void v3[4] = self;
  [MEMORY[0x1E4F7A648] commitAndNotifyOnQueue:transactionResponseQueue withBlock:v3];
}

void __60__PUParallaxLayerStackViewModelUpdater_endRenderTransaction__block_invoke(uint64_t a1)
{
}

- (void)beginRenderTransaction
{
  dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
  v2 = (void *)MEMORY[0x1E4F7A648];
  [v2 begin];
}

- (void)recalculateClockAreaLuminance:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  double v9 = [v8 currentLayerStack];
  [(PIParallaxClockMaterialRequest *)self->_clockMaterialRequest setLayerStack:v9];

  uint64_t v10 = [v8 style];
  [(PIParallaxClockMaterialRequest *)self->_clockMaterialRequest setStyle:v10];

  [(PUParallaxLayerStackViewModelUpdater *)self _updatePriorityForRequest:self->_clockMaterialRequest viewModel:v8 highPriority:v6 importanceOrder:a5];
  clockMaterialRequest = self->_clockMaterialRequest;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke;
  v13[3] = &unk_1E5F2E470;
  id v14 = v8;
  id v12 = v8;
  [(PIParallaxClockMaterialRequest *)clockMaterialRequest submit:v13];
  [(PIParallaxClockMaterialRequest *)self->_clockMaterialRequest setLayerStack:0];
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

void __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = [a2 result:&v9];
  id v4 = v9;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke_2;
    v7[3] = &unk_1E5F2E420;
    id v8 = v3;
    [v5 performChanges:v7];
    BOOL v6 = v8;
  }
  else
  {
    BOOL v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to compute clock luminance: %@", buf, 0xCu);
    }
  }
}

void __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) clockAreaLuminance];
  objc_msgSend(v3, "setClockAreaLuminance:");
  id v4 = PLWallpaperGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(a1 + 32) clockAreaLuminance];
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEBUG, "LuminanceForLook: setting luminance of %.2f for view model: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)recalculateClockOverlap:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 allViewModels:(id)a6 intersectionOnly:(BOOL)a7 completion:(id)a8
{
  BOOL v11 = a4;
  id v14 = a6;
  id v15 = a8;
  id v16 = a3;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  v17 = [v16 currentLayout];
  [(PIParallaxClockLayoutRequest *)self->_clockOverlapRequest setLayout:v17];

  [(PUParallaxLayerStackViewModelUpdater *)self _updatePriorityForRequest:self->_clockOverlapRequest viewModel:v16 highPriority:v11 importanceOrder:a5];
  clockOverlapRequest = self->_clockOverlapRequest;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke;
  v21[3] = &unk_1E5F2E4C0;
  BOOL v24 = a7;
  id v22 = v14;
  id v23 = v15;
  id v19 = v15;
  id v20 = v14;
  [(PIParallaxClockLayoutRequest *)clockOverlapRequest submit:v21];
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

void __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  id v3 = [a2 result:&v24];
  id v4 = v24;
  uint64_t v5 = v4;
  if (v3)
  {
    id v14 = v4;
    int v6 = [v3 clockLayerOrder];
    uint64_t v7 = [v3 clockIntersection];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke_2;
          v16[3] = &unk_1E5F2E498;
          char v19 = *(unsigned char *)(a1 + 48);
          v17 = v6;
          uint64_t v18 = v7;
          [v12 performChanges:v16];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v9);
    }

    uint64_t v5 = v14;
  }
  else
  {
    int v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to compute clock overlap: %@", buf, 0xCu);
    }
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

void __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 48))
  {
    [v3 setClockLayerOrder:*(void *)(a1 + 32)];
    id v3 = v4;
  }
  [v3 setClockIntersection:*(void *)(a1 + 40)];
}

- (void)renderSettlingEffectLayerIfNeededForViewModel:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 canEnableSettlingEffect])
  {
    uint64_t v9 = [v8 currentLayerStack];
    uint64_t v10 = [v9 settlingEffectLayer];
    if (v10)
    {
    }
    else
    {
      BOOL v11 = [v8 style];
      uint64_t v12 = [v11 kind];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4F8D020]];

      if (v13)
      {
        [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
        id v14 = [v8 currentLayout];
        [(PIParallaxLayerStackRequest *)self->_settlingEffectRenderRequest setLayout:v14];

        [(PIParallaxLayerStackRequest *)self->_settlingEffectRenderRequest setLayerStackMode:7];
        [(PUParallaxLayerStackViewModelUpdater *)self _updatePriorityForRequest:self->_settlingEffectRenderRequest viewModel:v8 highPriority:v6 importanceOrder:a5];
        settlingEffectRenderRequest = self->_settlingEffectRenderRequest;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke;
        v16[3] = &unk_1E5F2E470;
        id v17 = v8;
        [(PIParallaxLayerStackRequest *)settlingEffectRenderRequest submit:v16];
        [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
      }
    }
  }
}

void __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = [a2 result:&v9];
  id v4 = v9;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke_2;
    v7[3] = &unk_1E5F2E420;
    id v8 = v3;
    [v5 performChanges:v7];
    BOOL v6 = v8;
  }
  else
  {
    BOOL v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to render settling effect layer: %@", buf, 0xCu);
    }
  }
}

void __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layerStack];
  [v3 updateLayerStack:v4];
}

- (void)renderBackfillLayers:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  uint64_t v12 = [v10 currentLayout];
  [(PIParallaxLayerStackRequest *)self->_backfillRenderRequest setLayout:v12];

  int v13 = [v10 style];
  [(PIParallaxLayerStackRequest *)self->_backfillRenderRequest setStyle:v13];

  [(PIParallaxLayerStackRequest *)self->_backfillRenderRequest setLayerStackMode:2];
  [(PUParallaxLayerStackViewModelUpdater *)self _updatePriorityForRequest:self->_backfillRenderRequest viewModel:v10 highPriority:v8 importanceOrder:a5];
  backfillRenderRequest = self->_backfillRenderRequest;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  char v19 = __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke;
  long long v20 = &unk_1E5F2E448;
  id v21 = v10;
  id v22 = v11;
  id v15 = v11;
  id v16 = v10;
  [(PIParallaxLayerStackRequest *)backfillRenderRequest submit:&v17];
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

void __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v3 = [a2 result:&v13];
  id v4 = v13;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke_2;
    v11[3] = &unk_1E5F2E420;
    uint64_t v12 = v3;
    [v5 performChanges:v11];
    BOOL v6 = v12;
  }
  else
  {
    BOOL v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to render backfill layers: %@", buf, 0xCu);
    }
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v7, v8, v9);
  }
}

void __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layerStack];
  [v3 updateBackfillLayersFromLayerStack:v4];
}

- (void)renderMainLayers:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  [(PUParallaxLayerStackViewModelUpdater *)self beginRenderTransaction];
  uint64_t v12 = [v10 currentLayout];
  [(PIParallaxLayerStackRequest *)self->_mainRenderRequest setLayout:v12];

  id v13 = [v10 style];
  [(PIParallaxLayerStackRequest *)self->_mainRenderRequest setStyle:v13];

  -[PIParallaxLayerStackRequest setLayerStackMode:](self->_mainRenderRequest, "setLayerStackMode:", [v10 orientation] == 2);
  [(PUParallaxLayerStackViewModelUpdater *)self _updatePriorityForRequest:self->_mainRenderRequest viewModel:v10 highPriority:v8 importanceOrder:a5];
  mainRenderRequest = self->_mainRenderRequest;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  char v19 = __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke;
  long long v20 = &unk_1E5F2E448;
  id v21 = v10;
  id v22 = v11;
  id v15 = v11;
  id v16 = v10;
  [(PIParallaxLayerStackRequest *)mainRenderRequest submit:&v17];
  [(PUParallaxLayerStackViewModelUpdater *)self endRenderTransaction];
}

void __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v3 = [a2 result:&v13];
  id v4 = v13;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke_2;
    v11[3] = &unk_1E5F2E420;
    uint64_t v12 = v3;
    [v5 performChanges:v11];
    BOOL v6 = v12;
  }
  else
  {
    BOOL v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to render main layers: %@", buf, 0xCu);
    }
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v7, v8, v9);
  }
}

void __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layerStack];
  [v3 updateLayerStack:v4];
}

- (void)_updatePriorityForRequest:(id)a3 viewModel:(id)a4 highPriority:(BOOL)a5 importanceOrder:(double)a6
{
  BOOL v7 = a5;
  long long v23 = (PIParallaxClockMaterialRequest *)a3;
  id v10 = a4;
  id v11 = objc_alloc(MEMORY[0x1E4F7A5E8]);
  if (v7)
  {
    uint64_t v12 = (void *)[v11 initWithLevel:1 order:a6];
    [(PIParallaxClockMaterialRequest *)v23 setPriority:v12];

    double v13 = a6 * 0.1;
  }
  else
  {
    id v14 = (void *)[v11 initWithLevel:2 order:a6];
    [(PIParallaxClockMaterialRequest *)v23 setPriority:v14];

    double v13 = a6 * 0.25 + 0.25;
  }
  id v15 = [(PIParallaxClockMaterialRequest *)v23 renderContext];
  [v15 setMinimumRenderInterval:v13];

  if (self->_mainRenderRequest == v23)
  {
    uint64_t v17 = @"Main Layers";
  }
  else if (self->_backfillRenderRequest == v23)
  {
    uint64_t v17 = @"Backfill Layers";
  }
  else if (self->_settlingEffectRenderRequest == v23)
  {
    uint64_t v17 = @"Settling Effect Layer";
  }
  else if (self->_clockOverlapRequest == v23)
  {
    uint64_t v17 = @"Clock Overlap";
  }
  else if (self->_clockMaterialRequest == v23)
  {
    uint64_t v17 = @"Clock Luminance";
  }
  else
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v18 = [v10 style];
  uint64_t v19 = [v18 kind];
  long long v20 = (void *)v19;
  id v21 = @"Low Priority";
  if (v7) {
    id v21 = @"High Priority";
  }
  id v22 = [(__CFString *)v17 stringByAppendingFormat:@" %@ %@", v19, v21];

  [(PIParallaxClockMaterialRequest *)v23 setName:v22];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PUParallaxLayerStackViewModelUpdater alloc];
  uint64_t v5 = [(PUParallaxLayerStackViewModelUpdater *)self item];
  BOOL v6 = [(PUParallaxLayerStackViewModelUpdater *)v4 initWithSegmentationItem:v5];

  BOOL v7 = [(PUParallaxLayerStackViewModelUpdater *)self mainRenderRequest];
  uint64_t v8 = [v7 cache];
  uint64_t v9 = [(PUParallaxLayerStackViewModelUpdater *)v6 mainRenderRequest];
  [v9 setCache:v8];

  id v10 = [(PUParallaxLayerStackViewModelUpdater *)self backfillRenderRequest];
  id v11 = [v10 cache];
  uint64_t v12 = [(PUParallaxLayerStackViewModelUpdater *)v6 backfillRenderRequest];
  [v12 setCache:v11];

  return v6;
}

- (PUParallaxLayerStackViewModelUpdater)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = NSString;
      BOOL v7 = v5;
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(a2);
      id v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_136);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          id v14 = (void *)MEMORY[0x1E4F29060];
          id v15 = v13;
          uint64_t v16 = [v14 callStackSymbols];
          uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_136);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      long long v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      id v15 = v18;
      id v22 = [v20 callStackSymbols];
      long long v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      uint64_t v28 = v23;
      _os_log_error_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_136);
  }
}

- (PUParallaxLayerStackViewModelUpdater)initWithSegmentationItem:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PUParallaxLayerStackViewModelUpdater;
  BOOL v6 = [(PUParallaxLayerStackViewModelUpdater *)&v29 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    dispatch_group_t v8 = dispatch_group_create();
    transactionGroup = v7->_transactionGroup;
    v7->_transactionGroup = (OS_dispatch_group *)v8;

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("ViewModelUpdater transaction queue", v10);
    transactionResponseQueue = v7->_transactionResponseQueue;
    v7->_transactionResponseQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F8A320]) initWithSegmentationItem:v5];
    mainRenderRequest = v7->_mainRenderRequest;
    v7->_mainRenderRequest = (PIParallaxLayerStackRequest *)v13;

    id v15 = (void *)MEMORY[0x1E4F14428];
    [(PIParallaxLayerStackRequest *)v7->_mainRenderRequest setResponseQueue:MEMORY[0x1E4F14428]];
    [(PIParallaxLayerStackRequest *)v7->_mainRenderRequest setShouldCoalesceUpdates:1];
    [(PIParallaxLayerStackRequest *)v7->_mainRenderRequest setHeadroomBlurEnabled:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(PIParallaxLayerStackRequest *)v7->_mainRenderRequest setCache:v16];

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F8A320]) initWithSegmentationItem:v5];
    backfillRenderRequest = v7->_backfillRenderRequest;
    v7->_backfillRenderRequest = (PIParallaxLayerStackRequest *)v17;

    [(PIParallaxLayerStackRequest *)v7->_backfillRenderRequest setResponseQueue:v15];
    [(PIParallaxLayerStackRequest *)v7->_backfillRenderRequest setShouldCoalesceUpdates:1];
    [(PIParallaxLayerStackRequest *)v7->_backfillRenderRequest setHeadroomBlurEnabled:0];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(PIParallaxLayerStackRequest *)v7->_backfillRenderRequest setCache:v19];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F8A320]) initWithSegmentationItem:v5];
    settlingEffectRenderRequest = v7->_settlingEffectRenderRequest;
    v7->_settlingEffectRenderRequest = (PIParallaxLayerStackRequest *)v20;

    [(PIParallaxLayerStackRequest *)v7->_settlingEffectRenderRequest setResponseQueue:v15];
    [(PIParallaxLayerStackRequest *)v7->_settlingEffectRenderRequest setShouldCoalesceUpdates:1];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F8A2F8]) initWithSegmentationItem:v5];
    clockOverlapRequest = v7->_clockOverlapRequest;
    v7->_clockOverlapRequest = (PIParallaxClockLayoutRequest *)v22;

    [(PIParallaxClockLayoutRequest *)v7->_clockOverlapRequest setResponseQueue:v15];
    [(PIParallaxClockLayoutRequest *)v7->_clockOverlapRequest setShouldCoalesceUpdates:1];
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F8A300]) initWithLayerStack:0];
    clockMaterialRequest = v7->_clockMaterialRequest;
    v7->_clockMaterialRequest = (PIParallaxClockMaterialRequest *)v24;

    [(PIParallaxClockMaterialRequest *)v7->_clockMaterialRequest setResponseQueue:v15];
    [(PIParallaxClockMaterialRequest *)v7->_clockMaterialRequest setShouldCoalesceUpdates:1];
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F7A3F8]) initWithDelay:0.25];
    styleChangeCoalescer = v7->_styleChangeCoalescer;
    v7->_styleChangeCoalescer = (NUCoalescer *)v26;
  }
  return v7;
}

@end