@interface PXNodeRunner
- (PXNodeRunner)init;
- (int64_t)maxConcurrentRunNodeCount;
- (int64_t)qualityOfService;
- (void)_processRunGraph:(id)a3;
- (void)processGraphForRunNode:(id)a3;
- (void)setMaxConcurrentRunNodeCount:(int64_t)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation PXNodeRunner

- (void).cxx_destruct
{
}

- (void)processGraphForRunNode:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:a3];
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [v4 objectAtIndexedSubscript:v5];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v7 = objc_msgSend(v6, "dependencies", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            [v4 addObject:*(void *)(*((void *)&v14 + 1) + 8 * v11++)];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      ++v5;
    }
    while ([v4 count] > v5);
  }
  v12 = [v4 reversedOrderedSet];
  v13 = [v12 array];

  [(PXNodeRunner *)self _processRunGraph:v13];
}

- (void)_processRunGraph:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(PXRunNodeOperationMap);
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[PXRunNodeOperationMap objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(NSOperationQueue *)self->_operationQueue addOperations:v6 waitUntilFinished:0];
}

- (int64_t)qualityOfService
{
  return [(NSOperationQueue *)self->_operationQueue qualityOfService];
}

- (void)setQualityOfService:(int64_t)a3
{
}

- (void)setMaxConcurrentRunNodeCount:(int64_t)a3
{
}

- (int64_t)maxConcurrentRunNodeCount
{
  return [(NSOperationQueue *)self->_operationQueue maxConcurrentOperationCount];
}

- (PXNodeRunner)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXNodeRunner;
  v2 = [(PXNodeRunner *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
  }
  return v2;
}

@end