@interface TISerializingResultLogger
- (BOOL)bufferEmpty;
- (BOOL)bufferFull;
- (NSArray)partfileArchivePaths;
- (NSMutableArray)partfileArchivePathsMutable;
- (NSMutableArray)resultsBuffer;
- (NSURL)partfileURL;
- (OS_dispatch_queue)logSerializationQueue;
- (OS_dispatch_queue)partfileArchivePathsQueue;
- (TISerializingResultLogger)initWithOutputURL:(id)a3 flushThreshold:(id)a4;
- (id)allResults;
- (id)currentPartfileArchivePath;
- (unint64_t)flushThreshold;
- (unint64_t)partfileCount;
- (void)addResult:(id)a3;
- (void)flushBufferWithCompletionHandler:(id)a3;
- (void)serializeResultsArray:(id)a3;
@end

@implementation TISerializingResultLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partfileURL, 0);
  objc_storeStrong((id *)&self->_logSerializationQueue, 0);
  objc_storeStrong((id *)&self->_resultsBuffer, 0);
  objc_storeStrong((id *)&self->_partfileArchivePathsQueue, 0);
  objc_storeStrong((id *)&self->_partfileArchivePathsMutable, 0);
}

- (NSURL)partfileURL
{
  return self->_partfileURL;
}

- (OS_dispatch_queue)logSerializationQueue
{
  return self->_logSerializationQueue;
}

- (NSMutableArray)resultsBuffer
{
  return self->_resultsBuffer;
}

- (OS_dispatch_queue)partfileArchivePathsQueue
{
  return self->_partfileArchivePathsQueue;
}

- (NSMutableArray)partfileArchivePathsMutable
{
  return self->_partfileArchivePathsMutable;
}

- (unint64_t)flushThreshold
{
  return self->_flushThreshold;
}

- (unint64_t)partfileCount
{
  return self->_partfileCount;
}

- (id)allResults
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (![(TISerializingResultLogger *)self bufferEmpty])
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __39__TISerializingResultLogger_allResults__block_invoke;
    v26[3] = &unk_26504FDE0;
    dispatch_semaphore_t v27 = v3;
    v4 = v3;
    [(TISerializingResultLogger *)self flushBufferWithCompletionHandler:v26];
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(TISerializingResultLogger *)self partfileArchivePaths];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2455C2B00]();
        v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v10];
        v13 = (void *)MEMORY[0x263EFFA08];
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = objc_opt_class();
        v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
        uint64_t v21 = 0;
        v18 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v17 fromData:v12 error:&v21];
        [v5 addObjectsFromArray:v18];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

intptr_t __39__TISerializingResultLogger_allResults__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)serializeResultsArray:(id)a3
{
  uint64_t v6 = 0;
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  if (v4)
  {
    id v5 = [(TISerializingResultLogger *)self currentPartfileArchivePath];
    [v4 writeToFile:v5 atomically:1];
  }
}

- (void)flushBufferWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TISerializingResultLogger *)self resultsBuffer];
  uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  resultsBuffer = self->_resultsBuffer;
  self->_resultsBuffer = v6;

  uint64_t v8 = [(TISerializingResultLogger *)self logSerializationQueue];
  v11 = v4;
  id v9 = v4;
  id v10 = v5;
  TIDispatchAsync();
}

uint64_t __62__TISerializingResultLogger_flushBufferWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) serializeResultsArray:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    dispatch_semaphore_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)bufferEmpty
{
  v2 = [(TISerializingResultLogger *)self resultsBuffer];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)bufferFull
{
  v2 = self;
  BOOL v3 = [(TISerializingResultLogger *)self resultsBuffer];
  unint64_t v4 = [v3 count];
  LOBYTE(v2) = v4 >= [(TISerializingResultLogger *)v2 flushThreshold];

  return (char)v2;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  id v5 = [(TISerializingResultLogger *)self resultsBuffer];
  [v5 addObject:v4];

  if ([(TISerializingResultLogger *)self bufferFull])
  {
    [(TISerializingResultLogger *)self flushBufferWithCompletionHandler:0];
  }
}

- (id)currentPartfileArchivePath
{
  BOOL v3 = [(TISerializingResultLogger *)self partfileURL];
  id v4 = [v3 path];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[TISerializingResultLogger partfileCount](self, "partfileCount"));
  uint64_t v6 = [v4 stringByAppendingString:v5];

  ++self->_partfileCount;
  uint64_t v7 = [(TISerializingResultLogger *)self partfileArchivePathsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__TISerializingResultLogger_currentPartfileArchivePath__block_invoke;
  block[3] = &unk_26504FD90;
  block[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_barrier_sync(v7, block);

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __55__TISerializingResultLogger_currentPartfileArchivePath__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) partfileArchivePathsMutable];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSArray)partfileArchivePaths
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__1156;
  id v9 = __Block_byref_object_dispose__1157;
  id v10 = 0;
  id v2 = [(TISerializingResultLogger *)self partfileArchivePathsQueue];
  TIDispatchSync();

  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v3;
}

uint64_t __49__TISerializingResultLogger_partfileArchivePaths__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  return MEMORY[0x270F9A758]();
}

- (TISerializingResultLogger)initWithOutputURL:(id)a3 flushThreshold:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TISerializingResultLogger;
  id v8 = [(TISerializingResultLogger *)&v24 init];
  id v9 = v8;
  if (v8)
  {
    v8->_partfileCount = 0;
    if (v7) {
      uint64_t v10 = [v7 unsignedIntegerValue];
    }
    else {
      uint64_t v10 = 500;
    }
    v9->_flushThreshold = v10;
    uint64_t v11 = [v6 URLByAppendingPathExtension:@"part"];
    partfileURL = v9->_partfileURL;
    v9->_partfileURL = (NSURL *)v11;

    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    resultsBuffer = v9->_resultsBuffer;
    v9->_resultsBuffer = v13;

    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.autocorrection_tester.LogSerializationQueue", v15);
    logSerializationQueue = v9->_logSerializationQueue;
    v9->_logSerializationQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    partfileArchivePathsMutable = v9->_partfileArchivePathsMutable;
    v9->_partfileArchivePathsMutable = v18;

    v20 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.autocorrection_tester.partfileArchivePathsQueue", v20);
    partfileArchivePathsQueue = v9->_partfileArchivePathsQueue;
    v9->_partfileArchivePathsQueue = (OS_dispatch_queue *)v21;
  }
  return v9;
}

@end