@interface PUViewModel
- (BOOL)_isPublishingChanges;
- (NSHashTable)_changeObservers;
- (PUViewModel)init;
- (PUViewModelChange)currentChange;
- (PUViewModelChange)currentChangeIfExists;
- (id)newViewModelChange;
- (void)_applyPendingChanges;
- (void)_didChange;
- (void)_publishChanges;
- (void)_setPublishingChanges:(BOOL)a3;
- (void)_willChange;
- (void)assertInsideChangesBlock;
- (void)performChanges:(id)a3;
- (void)registerChangeObserver:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation PUViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->_currentChange, 0);
  objc_storeStrong((id *)&self->_pendingChangeBlocks, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (void)_setPublishingChanges:(BOOL)a3
{
  self->__publishingChanges = a3;
}

- (BOOL)_isPublishingChanges
{
  return self->__publishingChanges;
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PUViewModel_unregisterChangeObserver___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

void __40__PUViewModel_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isPublishingChanges])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) mutableCopy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;
  }
  id v5 = [*(id *)(a1 + 32) _changeObservers];
  [v5 removeObject:*(void *)(a1 + 40)];
}

- (void)registerChangeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PUViewModel_registerChangeObserver___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

void __38__PUViewModel_registerChangeObserver___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isPublishingChanges])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) mutableCopy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;
  }
  id v5 = [*(id *)(a1 + 32) _changeObservers];
  [v5 addObject:*(void *)(a1 + 40)];
}

- (void)_applyPendingChanges
{
  int64_t numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_int64_t numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (numAppliedPendingChanges >= 50)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUViewModel.m", 137, @"Change depth limit reached (%ld), this indicates infinite state ping-ponging, investigate the stack trace and figure out why the model doesn't reach a stable state. Typically because two observers are trying to set different new values in response to the same change.", 50 object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_pendingChangeBlocks count])
  {
    id v4 = (void *)[(NSMutableArray *)self->_pendingChangeBlocks copy];
    [(NSMutableArray *)self->_pendingChangeBlocks removeAllObjects];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__PUViewModel__applyPendingChanges__block_invoke;
    v8[3] = &unk_1E5F2ED10;
    id v9 = v4;
    id v5 = v4;
    [(PUViewModel *)self performChanges:v8];
  }
  --self->_numAppliedPendingChanges;
}

void __35__PUViewModel__applyPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
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
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_publishChanges
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__100578;
  v21 = __Block_byref_object_dispose__100579;
  id v22 = 0;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PUViewModel__publishChanges__block_invoke;
  block[3] = &unk_1E5F2E200;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(observerQueue, block);
  uint64_t v4 = [(PUViewModel *)self currentChange];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)v18[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 viewModel:self didChange:v4];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
    }
    while (v6);
  }

  v10 = self->_observerQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__PUViewModel__publishChanges__block_invoke_2;
  v11[3] = &unk_1E5F2ED10;
  v11[4] = self;
  dispatch_sync(v10, v11);

  _Block_object_dispose(&v17, 8);
}

void __30__PUViewModel__publishChanges__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPublishingChanges:1];
  uint64_t v2 = [*(id *)(a1 + 32) _changeObservers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __30__PUViewModel__publishChanges__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPublishingChanges:0];
}

- (void)_didChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (nestedChanges <= 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"PUViewModel.m", 96, @"%@ called without a change in progress.", v8 object file lineNumber description];

    int64_t nestedChanges = self->_nestedChanges;
  }
  if (nestedChanges == 1)
  {
    [(PUViewModel *)self didPerformChanges];
    if ([(PUViewModelChange *)self->_currentChange hasChanges]) {
      [(PUViewModel *)self willPublishChanges];
    }
  }
  int64_t v4 = self->_nestedChanges - 1;
  self->_int64_t nestedChanges = v4;
  if (!v4)
  {
    if ([(PUViewModelChange *)self->_currentChange hasChanges])
    {
      [(PUViewModel *)self _publishChanges];
      [(PUViewModel *)self didPublishChanges];
    }
    currentChange = self->_currentChange;
    self->_currentChange = 0;

    [(PUViewModel *)self _applyPendingChanges];
  }
}

- (void)_willChange
{
  if ([(PUViewModel *)self _isPublishingChanges])
  {
    int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PUViewModel.m", 90, @"PUViewModel currently disallows new changes while publishing changes. This requirement might have to be relaxed, but for now it is strict. This makes debugging easier and avoids ping-ponging state. Please figure out if the changes that are being made has to be made in reaction to a viewModel change, or could be made in some other way." object file lineNumber description];
  }
  ++self->_nestedChanges;
}

- (void)performChanges:(id)a3
{
  uint64_t v8 = (void (**)(void))a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUViewModel.m", 66, @"Invalid parameter not satisfying: %@", @"changeBlock != nil" object file lineNumber description];
  }
  if ([(PUViewModel *)self _isPublishingChanges])
  {
    pendingChangeBlocks = self->_pendingChangeBlocks;
    uint64_t v6 = (void *)[v8 copy];
    [(NSMutableArray *)pendingChangeBlocks addObject:v6];
  }
  else
  {
    [(PUViewModel *)self _willChange];
    v8[2]();
    [(PUViewModel *)self _didChange];
  }
}

- (PUViewModelChange)currentChangeIfExists
{
  return self->_currentChange;
}

- (PUViewModelChange)currentChange
{
  if (self->_nestedChanges >= 1 && !self->_currentChange)
  {
    int64_t v4 = [(PUViewModel *)self newViewModelChange];
    currentChange = self->_currentChange;
    self->_currentChange = v4;

    if (!self->_currentChange)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PUViewModel.m", 53, @"Invalid parameter not satisfying: %@", @"_currentChange != nil" object file lineNumber description];
    }
  }
  uint64_t v6 = self->_currentChange;
  return v6;
}

- (void)assertInsideChangesBlock
{
  if (self->_nestedChanges < 1 || [(PUViewModel *)self _isPublishingChanges])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUViewModel.m" lineNumber:45 description:@"Changes must be made inside a block passed to performChanges"];
  }
}

- (id)newViewModelChange
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PUViewModel.m", 40, @"Concrete subclass must implement %@", v5 object file lineNumber description];

  return 0;
}

- (PUViewModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUViewModel;
  uint64_t v2 = [(PUViewModel *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photos.viewmodel.observer-queue", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeObservers = v2->__changeObservers;
    v2->__changeObservers = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    pendingChangeBlocks = v2->_pendingChangeBlocks;
    v2->_pendingChangeBlocks = (NSMutableArray *)v7;
  }
  return v2;
}

@end