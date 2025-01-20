@interface MSVMultiCallback
- (BOOL)removeCallback:(id)a3;
- (MSVCallback)firstCallback;
- (MSVCallback)lastCallback;
- (MSVMultiCallback)init;
- (NSArray)callbacks;
- (unint64_t)count;
- (void)addCallback:(id)a3;
- (void)invoke;
- (void)invokeWithObject:(id)a3;
- (void)setFirstCallback:(id)a3;
- (void)setLastCallback:(id)a3;
@end

@implementation MSVMultiCallback

- (unint64_t)count
{
  v2 = [(MSVMultiCallback *)self callbacks];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSArray)callbacks
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5996;
  v11 = __Block_byref_object_dispose__5997;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__MSVMultiCallback_callbacks__block_invoke;
  v6[3] = &unk_1E5ADAAC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __29__MSVMultiCallback_callbacks__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16))
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObject:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:*(void *)(v2 + 8)];
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return objc_msgSend(v4, "addObject:");
  }
  return result;
}

void __37__MSVMultiCallback_setFirstCallback___block_invoke(uint64_t a1)
{
}

- (void)setFirstCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MSVMultiCallback_setFirstCallback___block_invoke;
  v7[3] = &unk_1E5ADAA78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (MSVMultiCallback)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSVMultiCallback;
  uint64_t v2 = [(MSVMultiCallback *)&v7 init];
  if (v2)
  {
    unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaServices.MultiCallback", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lastCallback, 0);
  objc_storeStrong((id *)&self->_firstCallback, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
}

- (void)invokeWithObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(MSVMultiCallback *)self callbacks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) invokeWithObject:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)invoke
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(MSVMultiCallback *)self callbacks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invoke];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)removeCallback:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MSVMultiCallback_removeCallback___block_invoke;
  block[3] = &unk_1E5ADAAA0;
  block[4] = self;
  id v9 = v4;
  long long v10 = &v11;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

uint64_t __35__MSVMultiCallback_removeCallback___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  id v4 = *(void **)(v3 + 16);
  if (v4 == v2)
  {
    *(void *)(v3 + 16) = 0;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v3 = a1[4];
    uint64_t v2 = (void *)a1[5];
  }
  if (*(void **)(v3 + 24) == v2)
  {
    *(void *)(v3 + 24) = 0;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v3 = a1[4];
    uint64_t v2 = (void *)a1[5];
  }
  uint64_t result = [*(id *)(v3 + 8) containsObject:v2];
  if (result)
  {
    uint64_t result = [*(id *)(a1[4] + 8) removeObject:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (MSVCallback)lastCallback
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5996;
  long long v10 = __Block_byref_object_dispose__5997;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MSVMultiCallback_lastCallback__block_invoke;
  v5[3] = &unk_1E5ADAAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MSVCallback *)v3;
}

void __32__MSVMultiCallback_lastCallback__block_invoke(uint64_t a1)
{
}

- (void)setLastCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MSVMultiCallback_setLastCallback___block_invoke;
  v7[3] = &unk_1E5ADAA78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __36__MSVMultiCallback_setLastCallback___block_invoke(uint64_t a1)
{
}

- (MSVCallback)firstCallback
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5996;
  long long v10 = __Block_byref_object_dispose__5997;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MSVMultiCallback_firstCallback__block_invoke;
  v5[3] = &unk_1E5ADAAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MSVCallback *)v3;
}

void __33__MSVMultiCallback_firstCallback__block_invoke(uint64_t a1)
{
}

- (void)addCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__MSVMultiCallback_addCallback___block_invoke;
  v7[3] = &unk_1E5ADAA78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __32__MSVMultiCallback_addCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

@end