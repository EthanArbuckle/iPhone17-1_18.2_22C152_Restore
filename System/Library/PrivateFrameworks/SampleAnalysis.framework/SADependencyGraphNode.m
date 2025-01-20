@interface SADependencyGraphNode
+ (id)dependencyGraphForThreadsInSampleStore:(id)a3 atTimestamp:(id)a4;
- (BOOL)isBlockedByADeadlock;
- (BOOL)isPartOfADeadlock;
- (SADependencyGraphNode)dependency;
- (SATask)task;
- (SATaskState)taskState;
- (SAThread)thread;
- (SAThreadState)threadState;
@end

@implementation SADependencyGraphNode

+ (id)dependencyGraphForThreadsInSampleStore:(id)a3 atTimestamp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1C18A6A20]();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke;
  v22[3] = &unk_1E63F8FB0;
  id v9 = v6;
  id v23 = v9;
  id v10 = v8;
  id v24 = v10;
  [v5 enumerateTasks:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_3;
  v20[3] = &unk_1E63F8FD8;
  id v11 = v10;
  id v21 = v11;
  [v11 enumerateKeysAndObjectsUsingBlock:v20];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_4;
  v18 = &unk_1E63F8FD8;
  id v19 = v11;
  id v12 = v11;
  [v12 enumerateKeysAndObjectsUsingBlock:&v15];
  v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18);

  return v13;
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 taskStates];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v7 = 0;
    goto LABEL_7;
  }
  id v6 = [v3 lastTaskStateOnOrBeforeTime:*(void *)(a1 + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 startTimestamp];
    if ([v8 gt:*(void *)(a1 + 32)])
    {

      goto LABEL_8;
    }
    id v9 = [v7 endTimestamp];
    char v10 = [v9 lt:*(void *)(a1 + 32)];

    if (v10) {
      goto LABEL_8;
    }
LABEL_7:
    id v11 = [v3 threads];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_2;
    v12[3] = &unk_1E63F8F88;
    id v13 = *(id *)(a1 + 32);
    id v14 = v3;
    id v7 = v7;
    id v15 = v7;
    id v16 = *(id *)(a1 + 40);
    [v11 enumerateKeysAndObjectsUsingBlock:v12];
  }
LABEL_8:
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  uint64_t v5 = [v19 lastThreadStateOnOrBeforeTime:a1[4] sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 startTimestamp];
    if (([(SADependencyGraphNode *)v7 gt:a1[4]] & 1) == 0)
    {
      id v8 = [v6 endTimestamp];
      char v9 = [v8 lt:a1[4]];

      if (v9) {
        goto LABEL_9;
      }
      id v7 = [SADependencyGraphNode alloc];
      id v11 = (void *)a1[5];
      char v10 = (void *)a1[6];
      id v12 = v11;
      id v13 = v10;
      id v14 = v19;
      id v15 = v6;
      if (v7)
      {
        v20.receiver = v7;
        v20.super_class = (Class)SADependencyGraphNode;
        id v16 = (SADependencyGraphNode *)objc_msgSendSuper2(&v20, sel_init);
        id v7 = v16;
        if (v16)
        {
          objc_storeStrong((id *)&v16->_task, v11);
          objc_storeStrong((id *)&v7->_taskState, v10);
          objc_storeStrong((id *)&v7->_thread, a3);
          objc_storeStrong((id *)&v7->_threadState, v6);
        }
      }

      v17 = (void *)a1[7];
      v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "threadId"));
      [v17 setObject:v7 forKeyedSubscript:v18];
    }
  }
LABEL_9:
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  v4 = [v12 threadState];
  uint64_t v5 = [v4 turnstileInfo];
  uint64_t v6 = [v5 blockingTid];
  if (v6)
  {
  }
  else
  {
    id v7 = [v12 threadState];
    id v8 = [v7 waitInfo];
    uint64_t v6 = [v8 blockingTid];

    if (!v6) {
      goto LABEL_7;
    }
  }
  char v9 = *(void **)(a1 + 32);
  char v10 = [NSNumber numberWithUnsignedLongLong:v6];
  id v11 = [v9 objectForKeyedSubscript:v10];
  if (v12) {
    objc_storeWeak(v12 + 6, v11);
  }

LABEL_7:
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = a3;
  if (!v4 || (v4[10] & 1) == 0)
  {
    id v22 = v4;
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = NSNumber;
    id v7 = [v22 thread];
    id v8 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "threadId"));
    char v9 = objc_msgSend(v5, "initWithObjects:", v8, 0);

    char v10 = [v22 dependency];
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10)
    {
      while (1)
      {
        if (v10[10])
        {
          if ([v10 isBlockedByADeadlock])
          {
            unint64_t v11 = [v9 count];
            goto LABEL_13;
          }
LABEL_11:
          unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_13;
        }
        id v12 = [v10 thread];
        uint64_t v13 = [v12 threadId];

        if (!v13) {
          goto LABEL_11;
        }
        id v14 = [NSNumber numberWithUnsignedLongLong:v13];
        uint64_t v15 = [v9 indexOfObject:v14];

        if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        id v16 = [NSNumber numberWithUnsignedLongLong:v13];
        [v9 addObject:v16];

        uint64_t v17 = [v10 dependency];

        char v10 = (unsigned char *)v17;
        if (!v17) {
          goto LABEL_11;
        }
      }
      unint64_t v11 = v15;
    }
LABEL_13:

    if ([v9 count])
    {
      unint64_t v18 = 0;
      do
      {
        id v19 = *(void **)(a1 + 32);
        objc_super v20 = [v9 objectAtIndexedSubscript:v18];
        id v21 = [v19 objectForKeyedSubscript:v20];

        if (v21)
        {
          v21[10] = 1;
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v21[9] = 1;
            if (v18 >= v11) {
              v21[8] = 1;
            }
          }
        }

        ++v18;
      }
      while (v18 < [v9 count]);
    }

    v4 = v22;
  }
}

- (SATask)task
{
  return (SATask *)objc_getProperty(self, a2, 16, 1);
}

- (SATaskState)taskState
{
  return (SATaskState *)objc_getProperty(self, a2, 24, 1);
}

- (SAThread)thread
{
  return (SAThread *)objc_getProperty(self, a2, 32, 1);
}

- (SAThreadState)threadState
{
  return (SAThreadState *)objc_getProperty(self, a2, 40, 1);
}

- (SADependencyGraphNode)dependency
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dependency);
  return (SADependencyGraphNode *)WeakRetained;
}

- (BOOL)isPartOfADeadlock
{
  return self->_isPartOfADeadlock;
}

- (BOOL)isBlockedByADeadlock
{
  return self->_isBlockedByADeadlock;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dependency);
  objc_storeStrong((id *)&self->_threadState, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_taskState, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end