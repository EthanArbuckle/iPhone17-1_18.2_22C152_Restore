@interface ISURLOperationPool
- (ISOperationQueue)operationQueue;
- (ISURLOperationPool)init;
- (id)_poolOperationForOperation:(id)a3 flags:(int64_t)a4;
- (void)addOperation:(id)a3 withFlags:(int64_t)a4;
- (void)cancelOperation:(id)a3;
- (void)dealloc;
- (void)setOperationQueue:(id)a3;
@end

@implementation ISURLOperationPool

- (ISURLOperationPool)init
{
  __ISRecordSPIClassUsage(self);
  v5.receiver = self;
  v5.super_class = (Class)ISURLOperationPool;
  v3 = [(ISURLOperationPool *)&v5 init];
  if (v3) {
    v3->_operationQueue = (ISOperationQueue *)+[ISOperationQueue mainQueue];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISURLOperationPool;
  [(ISURLOperationPool *)&v3 dealloc];
}

- (void)addOperation:(id)a3 withFlags:(int64_t)a4
{
  id v6 = [(ISURLOperationPool *)self _poolOperationForOperation:a3 flags:a4];
  if (v6)
  {
    [v6 addOperation:a3];
  }
  else
  {
    v7 = objc_alloc_init(ISURLOperationPoolOperation);
    [(ISURLOperationPoolOperation *)v7 addOperation:a3];
    [(ISOperationQueue *)self->_operationQueue addOperation:v7];
  }
}

- (void)cancelOperation:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [(ISOperationQueue *)self->_operationQueue operations];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
      if ([v9 containsOperation:a3]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    if (!v9) {
      goto LABEL_12;
    }
    [v9 cancelOperation:a3];
  }
  else
  {
LABEL_12:
    [a3 cancel];
  }
}

- (id)_poolOperationForOperation:(id)a3 flags:(int64_t)a4
{
  char v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)[a3 dataProvider];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "_requestProperties"), "URL");
  id v9 = [(ISOperationQueue *)self->_operationQueue operations];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v19;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v19 != v12) {
      objc_enumerationMutation(v9);
    }
    v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = (void *)[v14 mainOperation];
      if (objc_msgSend(v8, "isEqual:", objc_msgSend((id)objc_msgSend(v15, "_requestProperties"), "URL")))
      {
        uint64_t v16 = [v15 dataProvider];
        if (v4 & 1) != 0 && (v7 == (void *)v16 || ([v7 isEqual:v16])) {
          return v14;
        }
      }
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (ISOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

@end