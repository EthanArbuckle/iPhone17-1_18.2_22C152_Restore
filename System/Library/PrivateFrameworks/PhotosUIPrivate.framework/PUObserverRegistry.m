@interface PUObserverRegistry
- (NSPointerArray)_observers;
- (OS_dispatch_queue)_observerQueue;
- (PUObserverRegistry)init;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PUObserverRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__observerQueue, 0);
  objc_storeStrong((id *)&self->__observers, 0);
}

- (OS_dispatch_queue)_observerQueue
{
  return self->__observerQueue;
}

- (NSPointerArray)_observers
{
  return self->__observers;
}

- (void)enumerateObserversWithBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observerQueue = self->__observerQueue;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __50__PUObserverRegistry_enumerateObserversWithBlock___block_invoke;
    v13 = &unk_1E5F2ECC8;
    v14 = self;
    id v7 = v5;
    id v15 = v7;
    dispatch_sync(observerQueue, &v10);
    if (objc_msgSend(v7, "count", v10, v11, v12, v13, v14))
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [v7 pointerAtIndex:v8];
        v4[2](v4, v9);

        ++v8;
      }
      while (v8 < [v7 count]);
    }
  }
}

void __50__PUObserverRegistry_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _observers];
  if ([v4 count])
  {
    unint64_t v2 = 0;
    do
    {
      v3 = [v4 pointerAtIndex:v2];
      if (v3) {
        [*(id *)(a1 + 40) addPointer:v3];
      }

      ++v2;
    }
    while (v2 < [v4 count]);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    observerQueue = self->__observerQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PUObserverRegistry_unregisterObserver___block_invoke;
    v7[3] = &unk_1E5F2ECC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(observerQueue, v7);
  }
}

void __41__PUObserverRegistry_unregisterObserver___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _observers];
  if ([v3 count])
  {
    uint64_t v2 = 0;
    while ([v3 pointerAtIndex:v2] != *(void *)(a1 + 40))
    {
      if (++v2 >= (unint64_t)[v3 count]) {
        goto LABEL_7;
      }
    }
    [v3 removePointerAtIndex:v2];
  }
LABEL_7:
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    observerQueue = self->__observerQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__PUObserverRegistry_registerObserver___block_invoke;
    v7[3] = &unk_1E5F2ECC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(observerQueue, v7);
  }
}

void __39__PUObserverRegistry_registerObserver___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _observers];
  uint64_t v2 = [v6 count];
  id v3 = v6;
  if (v2)
  {
    unint64_t v4 = 0;
    while ([v3 pointerAtIndex:v4] != *(void *)(a1 + 40))
    {
      ++v4;
      unint64_t v5 = [v6 count];
      id v3 = v6;
      if (v4 >= v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    [v3 addPointer:*(void *)(a1 + 40)];
  }
}

- (PUObserverRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUObserverRegistry;
  uint64_t v2 = [(PUObserverRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observers = v2->__observers;
    v2->__observers = (NSPointerArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photosui.observerregistry.observer-queue", 0);
    observerQueue = v2->__observerQueue;
    v2->__observerQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end