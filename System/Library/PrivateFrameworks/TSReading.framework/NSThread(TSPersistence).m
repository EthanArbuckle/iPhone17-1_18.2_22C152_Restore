@interface NSThread(TSPersistence)
+ (uint64_t)tsp_hasReadFileAccess;
+ (uint64_t)tsp_isArchiverThread;
+ (uint64_t)tsp_performSynchronousArchiverOperationUsingBlock:()TSPersistence;
+ (uint64_t)tsp_performSynchronousOperationWithReadFileAccessUsingBlock:()TSPersistence;
+ (void)tsp_performSynchronousOperationMarkingThreadWithKey:()TSPersistence usingBlock:;
@end

@implementation NSThread(TSPersistence)

+ (uint64_t)tsp_isArchiverThread
{
  v1 = [a1 currentThread];
  v2 = [v1 threadDictionary];
  v3 = [v2 objectForKey:@"TSPIsArchiverThread"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

+ (uint64_t)tsp_performSynchronousArchiverOperationUsingBlock:()TSPersistence
{
  return objc_msgSend(a1, "tsp_performSynchronousOperationMarkingThreadWithKey:usingBlock:", @"TSPIsArchiverThread", a3);
}

+ (uint64_t)tsp_hasReadFileAccess
{
  v0 = [MEMORY[0x263F08B88] currentThread];
  v1 = [v0 threadDictionary];

  v2 = [v1 objectForKeyedSubscript:@"TSPHasFileAccess"];
  if ([v2 BOOLValue])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [v1 objectForKeyedSubscript:@"TSPIsArchiverThread"];
    uint64_t v3 = [v4 BOOLValue];
  }
  return v3;
}

+ (uint64_t)tsp_performSynchronousOperationWithReadFileAccessUsingBlock:()TSPersistence
{
  return objc_msgSend(a1, "tsp_performSynchronousOperationMarkingThreadWithKey:usingBlock:", @"TSPHasFileAccess", a3);
}

+ (void)tsp_performSynchronousOperationMarkingThreadWithKey:()TSPersistence usingBlock:
{
  id v9 = a3;
  v5 = a4;
  v6 = [MEMORY[0x263F08B88] currentThread];
  v7 = [v6 threadDictionary];

  v8 = [v7 objectForKeyedSubscript:v9];
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v9];
  v5[2](v5);
  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:v9];
  }
  else {
    [v7 removeObjectForKey:v9];
  }
}

@end