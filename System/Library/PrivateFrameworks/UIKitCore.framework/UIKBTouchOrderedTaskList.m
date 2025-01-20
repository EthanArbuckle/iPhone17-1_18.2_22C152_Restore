@interface UIKBTouchOrderedTaskList
+ (id)taskListForTouchUUID:(id)a3 withPathIndex:(unint64_t)a4;
- (BOOL)executeTasksInView:(id)a3 withBlock:(id)a4;
- (BOOL)hasTasks;
- (BOOL)ignoredOnBegin;
- (BOOL)isExecutingFirstTask;
- (NSUUID)touchUUID;
- (NSValue)currentTouchPoint;
- (UIKBTouchOrderedTaskList)initWithTouchUUID:(id)a3 withPathIndex:(unint64_t)a4;
- (double)originalStartTime;
- (id)firstTouchStateForUITouchPhase:(int64_t)a3;
- (unint64_t)pathIndex;
- (void)addTask:(id)a3;
- (void)dealloc;
- (void)removeTasksMatchingFilter:(id)a3;
- (void)setIgnoredOnBegin:(BOOL)a3;
@end

@implementation UIKBTouchOrderedTaskList

+ (id)taskListForTouchUUID:(id)a3 withPathIndex:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[UIKBTouchOrderedTaskList alloc] initWithTouchUUID:v5 withPathIndex:a4];

  return v6;
}

- (UIKBTouchOrderedTaskList)initWithTouchUUID:(id)a3 withPathIndex:(unint64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIKBTouchOrderedTaskList;
  v8 = [(UIKBTouchOrderedTaskList *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_touchUUID, a3);
    v9->_pathIndex = a4;
    dispatch_queue_t v10 = dispatch_queue_create(0, 0);
    touchStateTasksQueue = v9->_touchStateTasksQueue;
    v9->_touchStateTasksQueue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    touchStateTasks = v9->_touchStateTasks;
    v9->_touchStateTasks = v12;
  }
  return v9;
}

- (void)dealloc
{
  touchStateTasksQueue = self->_touchStateTasksQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__UIKBTouchOrderedTaskList_dealloc__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(touchStateTasksQueue, block);
  v4 = self->_touchStateTasksQueue;
  self->_touchStateTasksQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIKBTouchOrderedTaskList;
  [(UIKBTouchOrderedTaskList *)&v5 dealloc];
}

void __35__UIKBTouchOrderedTaskList_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (BOOL)hasTasks
{
  return [(NSMutableArray *)self->_touchStateTasks count] != 0;
}

- (void)addTask:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 touchState];
  uint64_t v6 = [v5 phase];

  if (!v6)
  {
    id v7 = [v4 touchState];
    [v7 timestamp];
    self->_originalStartTime = v8;
  }
  touchStateTasksQueue = self->_touchStateTasksQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__UIKBTouchOrderedTaskList_addTask___block_invoke;
  v11[3] = &unk_1E52D9F98;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_sync(touchStateTasksQueue, v11);
}

uint64_t __36__UIKBTouchOrderedTaskList_addTask___block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 24) count]
    || ([*(id *)(*(void *)(a1 + 32) + 24) lastObject],
        v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 compare:*(void *)(a1 + 40)],
        v2,
        v3 == -1))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = *(void **)(*(void *)(a1 + 32) + 24);
    return [v9 addObject:v8];
  }
  else
  {
    uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "indexOfObject:inSortedRange:options:usingComparator:", *(void *)(a1 + 40), 0, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"), 1024, &__block_literal_global_357);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24);
    return [v6 insertObject:v5 atIndex:v4];
  }
}

uint64_t __36__UIKBTouchOrderedTaskList_addTask___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isExecutingFirstTask
{
  v2 = [(NSMutableArray *)self->_touchStateTasks firstObject];
  char v3 = [v2 isBusy];

  return v3;
}

- (void)removeTasksMatchingFilter:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (unsigned int (**)(id, void))a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__134;
  v22 = __Block_byref_object_dispose__134;
  id v23 = 0;
  touchStateTasksQueue = self->_touchStateTasksQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke;
  block[3] = &unk_1E52E3210;
  block[4] = self;
  void block[5] = &v18;
  dispatch_sync(touchStateTasksQueue, block);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)v19[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v10))
        {
          v11 = self->_touchStateTasksQueue;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke_2;
          v12[3] = &unk_1E52D9F98;
          v12[4] = self;
          v12[5] = v10;
          dispatch_sync(v11, v12);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v18, 8);
}

void __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)executeTasksInView:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  BOOL v27 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__134;
  uint64_t v25 = __Block_byref_object_dispose__134;
  id v26 = 0;
  touchStateTasksQueue = self->_touchStateTasksQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke;
  block[3] = &unk_1E52E3210;
  block[4] = self;
  void block[5] = &v21;
  dispatch_sync(touchStateTasksQueue, block);
  v9 = (void *)v22[5];
  if (v9)
  {
    [v9 setIsBusy:1];
    if (v7
      && ([(id)v22[5] touchState],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [(id)v22[5] task],
          v11 = objc_claimAutoreleasedReturnValue(),
          v7[2](v7, v10, v11, &v27),
          v11,
          v10,
          v27))
    {
      [(id)v22[5] setIsBusy:0];
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F29238];
      long long v13 = [(id)v22[5] touchState];
      [v13 locationInWindow];
      objc_msgSend(v6, "convertPoint:fromView:", 0);
      objc_msgSend(v12, "valueWithCGPoint:");
      long long v14 = (NSValue *)objc_claimAutoreleasedReturnValue();
      currentTouchPoint = self->_currentTouchPoint;
      self->_currentTouchPoint = v14;

      long long v16 = self->_touchStateTasksQueue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke_2;
      v19[3] = &unk_1E52D9F70;
      v19[4] = self;
      dispatch_sync(v16, v19);
    }
  }
  BOOL v17 = v27;
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:0];
}

- (id)firstTouchStateForUITouchPhase:(int64_t)a3
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__134;
  long long v16 = __Block_byref_object_dispose__134;
  id v17 = 0;
  touchStateTasksQueue = self->_touchStateTasksQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__UIKBTouchOrderedTaskList_firstTouchStateForUITouchPhase___block_invoke;
  v11[3] = &unk_1E52E3210;
  v11[4] = self;
  void v11[5] = &v12;
  dispatch_sync(touchStateTasksQueue, v11);
  uint64_t v5 = v13;
  id v6 = (void *)v13[5];
  if (v6)
  {
    uint64_t v7 = [v6 phase];
    uint64_t v5 = v13;
    if (v7 != a3)
    {
      uint64_t v8 = (void *)v13[5];
      v13[5] = 0;

      uint64_t v5 = v13;
    }
  }
  id v9 = (id)v5[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __59__UIKBTouchOrderedTaskList_firstTouchStateForUITouchPhase___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) firstObject];
  uint64_t v2 = [v5 touchState];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSUUID)touchUUID
{
  return self->_touchUUID;
}

- (NSValue)currentTouchPoint
{
  return self->_currentTouchPoint;
}

- (unint64_t)pathIndex
{
  return self->_pathIndex;
}

- (double)originalStartTime
{
  return self->_originalStartTime;
}

- (BOOL)ignoredOnBegin
{
  return self->_ignoredOnBegin;
}

- (void)setIgnoredOnBegin:(BOOL)a3
{
  self->_ignoredOnBegin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouchPoint, 0);
  objc_storeStrong((id *)&self->_touchStateTasks, 0);
  objc_storeStrong((id *)&self->_touchStateTasksQueue, 0);
  objc_storeStrong((id *)&self->_touchUUID, 0);
}

@end