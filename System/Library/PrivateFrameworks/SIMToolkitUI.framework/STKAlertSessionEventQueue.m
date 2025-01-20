@interface STKAlertSessionEventQueue
- (STKAlertSessionEventQueue)init;
- (id)acquireEventQueueHaltingAssertionForReason:(id)a3;
- (void)_queue_dequeueEventsIfPossible;
- (void)_queue_enqueueEvent:(id)a3;
- (void)enqueue:(id)a3;
@end

@implementation STKAlertSessionEventQueue

- (STKAlertSessionEventQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)STKAlertSessionEventQueue;
  v2 = [(STKAlertSessionEventQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)acquireEventQueueHaltingAssertionForReason:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F29CD8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke;
  v15[3] = &unk_2645F46A0;
  v15[4] = self;
  v7 = (void *)[v6 initWithIdentifier:@"stk.telephony.eventQueueHaltingAssertion" forReason:v5 invalidationBlock:v15];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_3;
  block[3] = &unk_2645F44F8;
  block[4] = self;
  id v9 = v7;
  id v14 = v9;
  dispatch_async(queue, block);
  v10 = v14;
  id v11 = v9;

  return v11;
}

void __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_2;
  v7[3] = &unk_2645F44F8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (!result)
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_dequeueEventsIfPossible");
  }
  return result;
}

uint64_t __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void)enqueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__STKAlertSessionEventQueue_enqueue___block_invoke;
  v7[3] = &unk_2645F46C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __37__STKAlertSessionEventQueue_enqueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueEvent:", *(void *)(a1 + 40));
}

- (void)_queue_enqueueEvent:(id)a3
{
  id v9 = a3;
  BSDispatchQueueAssert();
  id v4 = v9;
  if (v9)
  {
    queue_eventQueue = self->_queue_eventQueue;
    if (!queue_eventQueue)
    {
      id v6 = [MEMORY[0x263EFF980] array];
      v7 = self->_queue_eventQueue;
      self->_queue_eventQueue = v6;

      queue_eventQueue = self->_queue_eventQueue;
    }
    id v8 = (void *)MEMORY[0x223C91DC0](v9);
    [(NSMutableArray *)queue_eventQueue addObject:v8];

    [(STKAlertSessionEventQueue *)self _queue_dequeueEventsIfPossible];
    id v4 = v9;
  }
}

- (void)_queue_dequeueEventsIfPossible
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)[(NSMutableArray *)self->_queue_eventQueue copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (![(NSMutableArray *)self->_queue_haltingAssertions count])
        {
          (*(void (**)(uint64_t))(v8 + 16))(v8);
          queue_eventQueue = self->_queue_eventQueue;
          v10 = (void *)MEMORY[0x223C91DC0](v8);
          [(NSMutableArray *)queue_eventQueue removeObject:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue_haltingAssertions, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end