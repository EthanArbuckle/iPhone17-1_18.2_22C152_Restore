@interface SSVBarrierOperationQueue
- (void)addBarrierOperation:(id)a3;
- (void)addOperation:(id)a3;
- (void)addOperationWithBlock:(id)a3;
- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4;
@end

@implementation SSVBarrierOperationQueue

- (void)addOperation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v14 = [(SSVBarrierOperationQueue *)self isSuspended];
  [(SSVBarrierOperationQueue *)self setSuspended:1];
  [(SSVBarrierOperationQueue *)self operations];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v13 = long long v19 = 0u;
  v5 = [v13 reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_getAssociatedObject(v10, (const void *)_SSVBarrierOperationQueueAssociatedObjectKeyIsBarrierOperation);
        int v12 = [v11 BOOLValue];

        if (v12) {
          [v4 addDependency:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v15.receiver = self;
  v15.super_class = (Class)SSVBarrierOperationQueue;
  [(SSVBarrierOperationQueue *)&v15 addOperation:v4];
  [(SSVBarrierOperationQueue *)self setSuspended:v14];
}

- (void)addOperationWithBlock:(id)a3
{
  id v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:a3];
  [(SSVBarrierOperationQueue *)self addOperation:v4];
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v20 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  unsigned int v19 = [(SSVBarrierOperationQueue *)self isSuspended];
  [(SSVBarrierOperationQueue *)self setSuspended:1];
  uint64_t v21 = self;
  [(SSVBarrierOperationQueue *)self operations];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v18 = v31 = 0u;
  v5 = [v18 reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = objc_getAssociatedObject(v10, (const void *)_SSVBarrierOperationQueueAssociatedObjectKeyIsBarrierOperation);
        int v12 = [v11 BOOLValue];

        if (v12)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v13 = v22;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                [*(id *)(*((void *)&v24 + 1) + 8 * j) addDependency:v10];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v15);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  v23.receiver = v21;
  v23.super_class = (Class)SSVBarrierOperationQueue;
  [(SSVBarrierOperationQueue *)&v23 addOperations:v22 waitUntilFinished:v20];
  [(SSVBarrierOperationQueue *)v21 setSuspended:v19];
}

- (void)addBarrierOperation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SSVBarrierOperationQueue *)self isSuspended];
  [(SSVBarrierOperationQueue *)self setSuspended:1];
  uint64_t v6 = [(SSVBarrierOperationQueue *)self operations];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addDependency:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  objc_setAssociatedObject(v4, (const void *)_SSVBarrierOperationQueueAssociatedObjectKeyIsBarrierOperation, MEMORY[0x1E4F1CC38], (void *)1);
  v11.receiver = self;
  v11.super_class = (Class)SSVBarrierOperationQueue;
  [(SSVBarrierOperationQueue *)&v11 addOperation:v4];
  [(SSVBarrierOperationQueue *)self setSuspended:v5];
}

@end