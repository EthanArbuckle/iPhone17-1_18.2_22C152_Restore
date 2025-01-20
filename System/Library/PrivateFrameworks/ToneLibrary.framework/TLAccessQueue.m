@interface TLAccessQueue
- (NSString)label;
- (TLAccessQueue)initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4;
- (void)_performSynchronousBlockInSerialQueue:(id)a3;
- (void)assertNotRunningInAccessQueue;
- (void)performAsynchronousBlock:(id)a3;
- (void)performSynchronousBlock:(id)a3;
@end

@implementation TLAccessQueue

- (TLAccessQueue)initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TLAccessQueue;
  v7 = [(TLAccessQueue *)&v23 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];

    if (!v6 || v4)
    {
      if (v6 && v4)
      {
        uint64_t v14 = [NSString stringWithFormat:@"%@.%@", v6, v9];
      }
      else
      {
        uint64_t v14 = [v9 copy];
      }
      v10 = (void *)v14;
      v15 = NSString;
      v16 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v16);
      [v15 stringWithFormat:@"%@.%@", v13, v10, v22];
    }
    else
    {
      v10 = (void *)[v6 copy];
      v11 = NSString;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [v11 stringWithFormat:@"%@.%@.%@", v13, v10, v9];
    v17 = };

    id v18 = v10;
    dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 UTF8String], 0);
    dispatch_queue_t v20 = v19;
    if (v9 && v18 && v17 && v19)
    {
      objc_storeStrong((id *)&v7->_label, v18);
      objc_storeStrong((id *)&v7->_threadLocalStorageKey, v17);
      objc_storeStrong((id *)&v7->_serialQueue, v20);
    }
    else
    {

      v7 = 0;
    }
  }
  return v7;
}

- (void)performSynchronousBlock:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];
  v7 = [v6 objectForKey:self->_threadLocalStorageKey];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    v4[2](v4);
  }
  else
  {
    serialQueue = self->_serialQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__TLAccessQueue_performSynchronousBlock___block_invoke;
    v10[3] = &unk_1E6C21A80;
    v10[4] = self;
    v11 = v4;
    dispatch_sync(serialQueue, v10);
  }
}

uint64_t __41__TLAccessQueue_performSynchronousBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSynchronousBlockInSerialQueue:*(void *)(a1 + 40)];
}

- (void)performAsynchronousBlock:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__TLAccessQueue_performAsynchronousBlock___block_invoke;
  v7[3] = &unk_1E6C21A80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __42__TLAccessQueue_performAsynchronousBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSynchronousBlockInSerialQueue:*(void *)(a1 + 40)];
}

- (void)assertNotRunningInAccessQueue
{
}

- (void)_performSynchronousBlockInSerialQueue:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  v5 = self->_threadLocalStorageKey;
  id v6 = (void (**)(void))a3;
  v7 = [v4 currentThread];
  id v8 = [v7 threadDictionary];

  [v8 setObject:MEMORY[0x1E4F1CC38] forKey:v5];
  v6[2](v6);

  [v8 removeObjectForKey:v5];
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_threadLocalStorageKey, 0);
}

@end