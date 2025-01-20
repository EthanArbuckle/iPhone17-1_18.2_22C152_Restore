@interface PXScheduler
+ (PXScheduler)sharedScheduler;
- (PXScheduler)init;
- (id)startTrackedAnimationWithLabel:(id)a3;
- (void)_enteredDefaultRunLoopMode;
- (void)_performBlock:(id)a3;
- (void)_performPendingBlocks;
- (void)_performPendingBlocksIfNeeded;
- (void)dispatchGraduallyOnMainThreadWhenNotAnimating:(id)a3;
- (void)dispatchInMainTransaction:(id)a3;
- (void)dispatchInMainTransactionAfterDelay:(double)a3 block:(id)a4;
- (void)dispatchOnMainThreadWhenNotScrolling:(id)a3;
- (void)dispatchOnMainThreadWhenNotScrollingAfterDelay:(double)a3 block:(id)a4;
- (void)endTrackedAnimation:(id)a3;
- (void)performPendingBlocksAfterAnimationIfPossible;
- (void)schedulePerformPendingBlocksAfterAnimation;
@end

@implementation PXScheduler

uint64_t __30__PXScheduler_sharedScheduler__block_invoke()
{
  sharedScheduler_scheduler = objc_alloc_init(PXScheduler);

  return MEMORY[0x270F9A758]();
}

- (PXScheduler)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXScheduler;
  v2 = [(PXScheduler *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingBlocks = v2->_pendingBlocks;
    v2->_pendingBlocks = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    performWhenNotAnimatingPendingBlocks = v2->_performWhenNotAnimatingPendingBlocks;
    v2->_performWhenNotAnimatingPendingBlocks = v5;

    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    activeAnimations = v2->_activeAnimations;
    v2->_activeAnimations = (NSHashTable *)v7;
  }
  return v2;
}

uint64_t __68__PXScheduler_dispatchOnMainThreadWhenNotScrollingAfterDelay_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchOnMainThreadWhenNotScrolling:*(void *)(a1 + 40)];
}

- (void)endTrackedAnimation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__PXScheduler_endTrackedAnimation___block_invoke;
  v6[3] = &unk_26545B778;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  px_dispatch_on_main_queue(v6);
}

- (void)dispatchGraduallyOnMainThreadWhenNotAnimating:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__PXScheduler_dispatchGraduallyOnMainThreadWhenNotAnimating___block_invoke;
  v6[3] = &unk_26545B750;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  px_dispatch_on_main_queue(v6);
}

- (void)performPendingBlocksAfterAnimationIfPossible
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_performWhenNotAnimatingPendingBlocks count])
  {
    v3 = [(NSHashTable *)self->_activeAnimations allObjects];
    uint64_t v4 = [v3 count];

    if (!v4)
    {
      id v5 = [MEMORY[0x263EFF9F0] mainRunLoop];
      v6 = [v5 currentMode];
      char v7 = [v6 isEqualToString:*MEMORY[0x263EFF478]];

      if (v7)
      {
        memset(v12, 0, sizeof(v12));
        v8 = (void *)[(NSMutableArray *)self->_performWhenNotAnimatingPendingBlocks copy];
        if ([v8 countByEnumeratingWithState:v12 objects:v13 count:16])
        {
          uint64_t v9 = **((void **)&v12[0] + 1);
          performWhenNotAnimatingPendingBlocks = self->_performWhenNotAnimatingPendingBlocks;
          v11 = _Block_copy(**((const void ***)&v12[0] + 1));
          [(NSMutableArray *)performWhenNotAnimatingPendingBlocks removeObject:v11];

          (*(void (**)(uint64_t))(v9 + 16))(v9);
        }

        if ([(NSMutableArray *)self->_performWhenNotAnimatingPendingBlocks count]) {
          [(PXScheduler *)self schedulePerformPendingBlocksAfterAnimation];
        }
      }
      else
      {
        [(PXScheduler *)self schedulePerformPendingBlocksAfterAnimation];
      }
    }
  }
}

- (void)schedulePerformPendingBlocksAfterAnimation
{
  if (!self->_hasPendingPerformInDefaultRunLoopModeForAnimationTracking)
  {
    self->_hasPendingPerformInDefaultRunLoopModeForAnimationTracking = 1;
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke;
    v2[3] = &unk_26545BC00;
    v2[4] = self;
    px_perform_on_main_runloop(2, v2);
  }
}

uint64_t __61__PXScheduler_dispatchGraduallyOnMainThreadWhenNotAnimating___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = _Block_copy(*(const void **)(a1 + 40));
  [v2 addObject:v3];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 schedulePerformPendingBlocksAfterAnimation];
}

uint64_t __35__PXScheduler_endTrackedAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 schedulePerformPendingBlocksAfterAnimation];
}

uint64_t __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 0;
  return [*(id *)(a1 + 32) performPendingBlocksAfterAnimationIfPossible];
}

+ (PXScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1) {
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_7647);
  }
  v2 = (void *)sharedScheduler_scheduler;

  return (PXScheduler *)v2;
}

- (void)_performPendingBlocksIfNeeded
{
  if ([(NSMutableArray *)self->_pendingBlocks count] && !self->_isPerformingPendingBlocks)
  {
    [(PXScheduler *)self _performPendingBlocks];
  }
}

- (void)_performBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

uint64_t __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__PXScheduler_schedulePerformPendingBlocksAfterAnimation__block_invoke_2;
  v3[3] = &unk_26545BC00;
  v3[4] = v1;
  return [v1 dispatchOnMainThreadWhenNotScrollingAfterDelay:v3 block:0.05];
}

- (void)dispatchOnMainThreadWhenNotScrollingAfterDelay:(double)a3 block:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__PXScheduler_dispatchOnMainThreadWhenNotScrollingAfterDelay_block___block_invoke;
  v9[3] = &unk_26545B750;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

- (void)dispatchOnMainThreadWhenNotScrolling:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = _Block_copy(a3);
  v6[0] = *MEMORY[0x263EFF478];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PXScheduler *)self performSelectorOnMainThread:sel__performBlock_ withObject:v4 waitUntilDone:0 modes:v5];
}

- (id)startTrackedAnimationWithLabel:(id)a3
{
  id v4 = a3;
  id v5 = [[PXSchedulerTrackedAnimation alloc] initWithScheduler:self label:v4];

  [(NSHashTable *)self->_activeAnimations addObject:v5];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAnimations, 0);
  objc_storeStrong((id *)&self->_performWhenNotAnimatingPendingBlocks, 0);

  objc_storeStrong((id *)&self->_pendingBlocks, 0);
}

- (void)_performPendingBlocks
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL isPerformingPendingBlocks = self->_isPerformingPendingBlocks;
  self->_BOOL isPerformingPendingBlocks = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_pendingBlocks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_pendingBlocks removeAllObjects];
  self->_BOOL isPerformingPendingBlocks = isPerformingPendingBlocks;
}

- (void)_enteredDefaultRunLoopMode
{
  self->_hasPendingPerformInDefaultRunLoopMode = 0;
  [(PXScheduler *)self _performPendingBlocksIfNeeded];
}

- (void)dispatchInMainTransactionAfterDelay:(double)a3 block:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__PXScheduler_dispatchInMainTransactionAfterDelay_block___block_invoke;
  v9[3] = &unk_26545B750;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

uint64_t __57__PXScheduler_dispatchInMainTransactionAfterDelay_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchInMainTransaction:*(void *)(a1 + 40)];
}

- (void)dispatchInMainTransaction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __41__PXScheduler_dispatchInMainTransaction___block_invoke;
  v6[3] = &unk_26545B750;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  px_dispatch_on_main_queue(v6);
}

void __41__PXScheduler_dispatchInMainTransaction___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9F0] mainRunLoop];
  v3 = [v2 currentMode];
  uint64_t v4 = *MEMORY[0x263EFF478];
  char v5 = [v3 isEqualToString:*MEMORY[0x263EFF478]];

  if ((v5 & 1) != 0
    || *(unsigned char *)(*(void *)(a1 + 32) + 33)
    || ([MEMORY[0x263F158F8] currentState] & 3) != 0)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 8);
    id v8 = (void *)[*(id *)(a1 + 40) copy];
    [v7 addObject:v8];

    if (!*(unsigned char *)(*(void *)(a1 + 32) + 32) && (PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
      long long v9 = *(void **)(a1 + 32);
      v11[0] = v4;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      [v9 performSelector:sel__enteredDefaultRunLoopMode withObject:0 afterDelay:v10 inModes:0.0];
    }
  }
}

@end