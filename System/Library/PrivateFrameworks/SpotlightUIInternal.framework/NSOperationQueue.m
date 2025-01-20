@interface NSOperationQueue
@end

@implementation NSOperationQueue

void __69__NSOperationQueue_SPUIAdditions__logStateOperationCountGreaterThan___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((unint64_t)[*(id *)(a1 + 32) operationCount] > *(void *)(a1 + 40))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v2 = [*(id *)(a1 + 32) operations];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      LODWORD(v5) = 0;
      LODWORD(v6) = 0;
      LODWORD(v7) = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v2);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v7 = v7 + [v10 isExecuting];
          uint64_t v5 = v5 + [v10 isCancelled];
          uint64_t v6 = v6 + [v10 isFinished];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }

    NSLog(&cfstr_QueueStateCoun.isa, [*(id *)(a1 + 32) operationCount], v7, v5, v6);
  }
}

@end