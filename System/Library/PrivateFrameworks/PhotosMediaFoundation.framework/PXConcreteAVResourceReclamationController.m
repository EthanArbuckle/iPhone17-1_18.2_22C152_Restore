@interface PXConcreteAVResourceReclamationController
- (PXAVResourceReclamationEvent)mostRecentReclamationEvent;
- (PXConcreteAVResourceReclamationController)init;
- (id)observationWithWeakTarget:(id)a3 selector:(SEL)a4;
- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3;
- (void)_enumerateObservers:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setMostRecentReclamationEvent:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PXConcreteAVResourceReclamationController

uint64_t __62__PXConcreteAVResourceReclamationController_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  observersQueue = self->_observersQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__PXConcreteAVResourceReclamationController_registerObserver___block_invoke;
  v7[3] = &unk_265454F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observersQueue, v7);
}

- (PXConcreteAVResourceReclamationController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXConcreteAVResourceReclamationController;
  v2 = [(PXConcreteAVResourceReclamationController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.PXConcreteAVResourceReclamationController.observers", v6);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentReclamationEvent, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (PXAVResourceReclamationEvent)mostRecentReclamationEvent
{
  return self->_mostRecentReclamationEvent;
}

- (void)_enumerateObservers:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__PXConcreteAVResourceReclamationController__enumerateObservers___block_invoke;
  block[3] = &unk_265454F88;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(observersQueue, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v16[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * v9)) {
          v4[2](v4);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __65__PXConcreteAVResourceReclamationController__enumerateObservers___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  return MEMORY[0x270F9A758]();
}

- (void)setMostRecentReclamationEvent:(id)a3
{
  v5 = (PXAVResourceReclamationEvent *)a3;
  if (self->_mostRecentReclamationEvent != v5)
  {
    objc_storeStrong((id *)&self->_mostRecentReclamationEvent, a3);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __75__PXConcreteAVResourceReclamationController_setMostRecentReclamationEvent___block_invoke;
    v6[3] = &unk_265454F60;
    uint64_t v7 = v5;
    [(PXConcreteAVResourceReclamationController *)self _enumerateObservers:v6];
  }
}

uint64_t __75__PXConcreteAVResourceReclamationController_setMostRecentReclamationEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resourceReclamationEventDidOccur:*(void *)(a1 + 32)];
}

- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3
{
  return 0;
}

- (id)observationWithWeakTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  uint64_t v7 = [[PXResourceReclamationObservation alloc] initWithController:self weakTarget:v6 selector:a4];

  return v7;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  observersQueue = self->_observersQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__PXConcreteAVResourceReclamationController_unregisterObserver___block_invoke;
  v7[3] = &unk_265454F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observersQueue, v7);
}

uint64_t __64__PXConcreteAVResourceReclamationController_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

@end