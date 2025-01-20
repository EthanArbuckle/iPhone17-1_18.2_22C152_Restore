@interface STStorageGroupSizeOperation
+ (id)operationForOperations:(id)a3;
- (NSArray)operations;
- (void)cancel;
- (void)main;
- (void)setOperations:(id)a3;
@end

@implementation STStorageGroupSizeOperation

+ (id)operationForOperations:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(STStorageGroupSizeOperation);
  [(STStorageGroupSizeOperation *)v4 setOperations:v3];

  return v4;
}

- (void)main
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(STStorageGroupSizeOperation *)self operations];
  v4 = [MEMORY[0x263F08A48] currentQueue];
  [v4 addOperations:v3 waitUntilFinished:1];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "error", (void)v15);

        if (v13)
        {
          uint64_t v14 = [v12 error];

          v8 = (void *)v14;
        }
        v9 += [v12 size];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    uint64_t v9 = 0;
  }

  [(STStorageSizeOperation *)self setSize:v9];
  [(STStorageOperation *)self setError:v8];
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(STStorageGroupSizeOperation *)self operations];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)STStorageGroupSizeOperation;
  [(STStorageGroupSizeOperation *)&v8 cancel];
}

- (NSArray)operations
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setOperations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end