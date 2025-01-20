@interface NTKSnapshotRequest
- (NTKSnapshotLoadState)loadState;
- (NTKSnapshotRequest)init;
- (id)observeChangesToLoadStateWithPriority:(unint64_t)a3 callback:(id)a4;
- (unint64_t)priority;
- (void)observeChangesToLoadStateWithToken:(id)a3;
- (void)setLoadState:(id)a3;
- (void)stopObservingChanges:(id)a3;
- (void)updatePriority;
@end

@implementation NTKSnapshotRequest

- (NTKSnapshotRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSnapshotRequest;
  v2 = [(NTKSnapshotRequest *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_tokens = v3->_lock_tokens;
    v3->_lock_tokens = (NSHashTable *)v4;

    uint64_t v6 = +[NTKSnapshotLoadState pending];
    lock_loadState = v3->_lock_loadState;
    v3->_lock_loadState = (NTKSnapshotLoadState *)v6;

    v3->_lock_priority = 1;
  }
  return v3;
}

- (NTKSnapshotLoadState)loadState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_loadState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLoadState:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_loadState, a3);
  uint64_t v6 = [(NSHashTable *)self->_lock_tokens allObjects];
  os_unfair_lock_unlock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__NTKSnapshotRequest_setLoadState___block_invoke;
  aBlock[3] = &unk_1E62C09C0;
  id v7 = v6;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  objc_super v9 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v9[2](v9);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__NTKSnapshotRequest_setLoadState___block_invoke_2;
    block[3] = &unk_1E62C0718;
    v11 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __35__NTKSnapshotRequest_setLoadState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "callback", (void)v9);
        id v8 = (void *)v7;
        if (v7) {
          (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 40));
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __35__NTKSnapshotRequest_setLoadState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePriority
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSHashTable *)self->_lock_tokens allObjects];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__NTKSnapshotRequest_updatePriority__block_invoke;
  v5[3] = &unk_1E62C3FA0;
  v5[4] = &v6;
  [v4 enumerateObjectsUsingBlock:v5];
  self->_lock_priority = v7[3];
  os_unfair_lock_unlock(p_lock);
  _Block_object_dispose(&v6, 8);
}

unint64_t __36__NTKSnapshotRequest_updatePriority__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = [a2 priority];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (result > *(void *)(v7 + 24)) {
    *(void *)(v7 + 24) = result;
  }
  if (result == 3) {
    *a4 = 1;
  }
  return result;
}

- (unint64_t)priority
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_priority = self->_lock_priority;
  os_unfair_lock_unlock(p_lock);
  return lock_priority;
}

- (void)observeChangesToLoadStateWithToken:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_tokens addObject:v4];
  uint64_t v5 = self->_lock_loadState;
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = [v4 callback];
  if (v6)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      ((void (**)(void, NTKSnapshotLoadState *))v6)[2](v6, v5);
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __57__NTKSnapshotRequest_observeChangesToLoadStateWithToken___block_invoke;
      long long v10 = &unk_1E62C0AE8;
      long long v12 = v6;
      long long v11 = v5;
      dispatch_async(MEMORY[0x1E4F14428], &v7);
    }
  }
  objc_msgSend(v4, "setRequest:", self, v7, v8, v9, v10);
  [(NTKSnapshotRequest *)self updatePriority];
}

uint64_t __57__NTKSnapshotRequest_observeChangesToLoadStateWithToken___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)observeChangesToLoadStateWithPriority:(unint64_t)a3 callback:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [[NTKSnapshotToken alloc] initWithPriority:a3 callback:v6];

  [(NTKSnapshotRequest *)self observeChangesToLoadStateWithToken:v7];
  return v7;
}

- (void)stopObservingChanges:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_tokens removeObject:v5];

  os_unfair_lock_unlock(p_lock);
  [(NTKSnapshotRequest *)self updatePriority];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_loadState, 0);
  objc_storeStrong((id *)&self->_lock_tokens, 0);
}

@end