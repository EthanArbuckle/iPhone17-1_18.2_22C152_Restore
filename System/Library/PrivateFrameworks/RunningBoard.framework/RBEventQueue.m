@interface RBEventQueue
- (NSArray)events;
- (RBEventQueue)initWithQueue:(id)a3 timeProvider:(id)a4;
- (RBEventQueueEvent)nextEvent;
- (id)description;
- (unint64_t)count;
- (void)_queue_processEvents;
- (void)_queue_startEventTimer;
- (void)addEvent:(id)a3;
- (void)addEvents:(id)a3;
- (void)batchModify:(id)a3;
- (void)removeEvent:(id)a3;
- (void)removeEvents:(id)a3;
@end

@implementation RBEventQueue

uint64_t __28__RBEventQueue_batchModify___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSArray)events
{
  return &self->_eventQueue->super;
}

- (void)batchModify:(id)a3
{
  queue = self->_queue;
  v6 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  if (self->_inModifyBlock)
  {
    v6[2]();
  }
  else
  {
    self->_inModifyBlock = 1;
    v6[2]();

    BOOL dirtyDuringModify = self->_dirtyDuringModify;
    *(_WORD *)&self->_inModifyBlock = 0;
    if (dirtyDuringModify) {
      [(NSMutableArray *)self->_eventQueue sortUsingComparator:&__block_literal_global_4];
    }
    -[RBEventQueue _queue_startEventTimer]((uint64_t)self);
  }
}

- (void)_queue_startEventTimer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Event queue more than 5 seconds late, expected to fire at %f and it's now %f", (uint8_t *)&v4, 0x16u);
}

uint64_t __26__RBEventQueue_addEvents___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) addObjectsFromArray:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 50) = 1;
  return result;
}

- (void)addEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  __int16 v6 = [v4 arrayWithObjects:&v7 count:1];

  -[RBEventQueue addEvents:](self, "addEvents:", v6, v7, v8);
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __26__RBEventQueue_addEvents___block_invoke;
    v5[3] = &unk_2647C7B98;
    v5[4] = self;
    id v6 = v4;
    [(RBEventQueue *)self batchModify:v5];
  }
}

uint64_t __29__RBEventQueue_removeEvents___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) removeObjectsInArray:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 50) = 1;
  return result;
}

- (void)removeEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __29__RBEventQueue_removeEvents___block_invoke;
    v5[3] = &unk_2647C7B98;
    v5[4] = self;
    id v6 = v4;
    [(RBEventQueue *)self batchModify:v5];
  }
}

- (void)removeEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[RBEventQueue removeEvents:](self, "removeEvents:", v6, v7, v8);
}

- (RBEventQueue)initWithQueue:(id)a3 timeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RBEventQueue;
  v9 = [(RBEventQueue *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_timeProvider, a4);
  }

  return v10;
}

- (unint64_t)count
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  eventQueue = self->_eventQueue;
  return [(NSMutableArray *)eventQueue count];
}

- (RBEventQueueEvent)nextEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  eventQueue = self->_eventQueue;
  return (RBEventQueueEvent *)[(NSMutableArray *)eventQueue firstObject];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [(NSMutableArray *)self->_eventQueue count];
  id v6 = [(NSMutableArray *)self->_eventQueue componentsJoinedByString:@",\n\t"];
  id v7 = (void *)[v3 initWithFormat:@"<%@| eventCount:%lu events:[\n\t%@\n\t]>", v4, v5, v6];

  return v7;
}

- (void)_queue_processEvents
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_226AB3000, log, OS_LOG_TYPE_DEBUG, "Skipping _queue_processEvents - already in progress", v1, 2u);
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __38__RBEventQueue__queue_startEventTimer__block_invoke_2;
  activity_block[3] = &unk_2647C7CC8;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_226AB3000, "timer", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_2(uint64_t a1)
{
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_8(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __38__RBEventQueue__queue_startEventTimer__block_invoke_2_9;
  activity_block[3] = &unk_2647C7CC8;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_226AB3000, "timer", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_2_9(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvent, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end